use std log
use utils.nu ["or-else"]

export def "windows theme" []: [bool -> nothing, nothing -> nothing] {
    let t = $in | or-else { true }
    let l = if ($t) { "light" } else { "dark" }
    let dir = ($env.LOCALAPPDATA | path join "Microsoft" "Windows Terminal" "Fragments" "winterthemes")
    let theme = ($dir
    | path join $"($l).json"
    | open $in
    | get schemes.name
    | shuffle
    | first
    )
    log info $"Setting Windows Terminal ($l) theme to ($theme)"

    let cfg = ($nu.home-path | path join "scoop" "persist" "windows-terminal" "settings" "settings.json")
    let jq = ["profiles", "defaults", "colorScheme", $l] | into cell-path
    ( open $cfg
    | update $jq $theme
    | save -f $cfg
    )
}
