use std log
use ../utils.nu ["or-else", "rand"]

def cfg-dir [] {
    try {
        $env.XDG_CONFIG_HOME
    } catch {
        ($nu.home-path | path join ".config")
    } | path join "alacritty"
}

def cfg-file [] {
    (cfg-dir) | path join "alacritty.toml"
}

# Sets a random theme
export def "theme" []: [bool -> nothing, nothing -> nothing] {
    let t = $in | or-else { true }
    let color: string = if ($t) { "light" } else { "dark" }
    let name = ( cfg-dir
    | path join "themes" "groups.yml"
    | open $in
    | get ([$color] | into cell-path)
    | rand
    )
    theme set $name
}

# Lists known themes, ideally divided into light and dark
export def "theme list" []: nothing -> record<light: list<string>, dark: list<string>> {
    ( (cfg-dir)
    | path join "themes" "groups.yml"
    | open $in
    )
}

# Sets the theme to a specific name.
export def "theme set" [name: string] {
    log info $"setting alacritty theme to ($name)"
    mut config = cfg-file | open $in
    let imports = ($config
    | get general.import
    | where $it !~ "alacritty/themes/themes"
    | append ([(cfg-dir), "themes", "themes", $"($name).toml"] | path join))
    $config | update general.import $imports | to toml | save -f (cfg-file)
}
