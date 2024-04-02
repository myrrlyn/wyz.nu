use std log

use utils.nu ["try-update"]

export def "list" [] {
    (^scoop list
    | lines
    | skip 2
    | reject 1
    | ansi strip
    | str trim
    | filter { is-not-empty }
    | parse -r "^(?P<Name>[^ ]+) +(?P<Version>[^ ]+) +(?P<Source>[^ ]+) +(?P<Updated>[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}) ?(?P<Info>.*)?.*$"
    | update Updated { into datetime }
    )
}

export def "info" [
    name: string,
    --all (-a)
] {
    if ($all) { list | get Name | each { info $in } } else {
        (^scoop info $name
        | ansi strip
        | str trim
        | str replace -ar " *\n +" " "
        | lines
        | str replace -r " +: " "\t"
        | str join "\n"
        | from tsv --noheaders
        | transpose -r
        | update "Updated at" { into datetime }
        | try-update Installed { split row " " | str trim }
        | try-update Binaries { split row " | " | str trim }
        | try-update Shortcuts { split row " " | str trim }
        | get -i 0
        )
    }
}
