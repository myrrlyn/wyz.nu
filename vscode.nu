use std log

use utils.nu ["or-else"]

def "vscode install-dir" []: nothing -> string {
    if ($nu.os-info.name == "windows") {
        $"($nu.home-path)/scoop/persist/vscode/"
    } else {
        std log error $"Don't know how to find VSCode installs on ($nu.os-info.name)"
        "~/vscode"
    }
}

export def rainglow [--theme (-t): string]: nothing -> nothing {
    let exts = (vscode install-dir) | path join data extensions
    let rainglow_dir = try {
        ls $exts | get name | where $it =~ rainglow | first
    } catch {
        std log error "Rainglow extension not installed"
        return
    }
    let pkg = $rainglow_dir | path join package.json | open $in
    let themes = $pkg | get contributes.themes.label
    let light = $themes | where $it =~ Light
    let dark = $themes | where $it =~ Contrast
    let mid = $themes | where $it !~ Light | where $it !~ Contrast
    let setting = match $theme {
        null | "light" => {key: "Light", val: ($light | shuffle | first)}
        "dark" => {key: "Dark", val: ($dark | shuffle | first)}
        _ => {
            std log error "Unknown --theme argument"
            return
        }
    }
    let cfg = (vscode install-dir) | path join data user-data User settings.json
    log info $"Setting VSCode ($setting.key) color theme to ($setting.val)"
    $cfg | open $in | update $"workbench.preferred($setting.key)ColorTheme" $setting.val | save -f $cfg
    null
}
