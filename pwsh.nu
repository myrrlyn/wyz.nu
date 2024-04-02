export def "gen color" []: bool -> string {
    let theme: number = if ($in) { 1 } else { 0 }
    ( ["SystemUses", "AppsUse"]
    | each { $"($in)LightTheme" }
    | each { [
        "New-ItemProperty", "-Path",
        `HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize`,
        "-Name", $in, "-Value", $theme, "-Type", "Dword", "-Force"
    ] | str join " " }
    | str join "; "
    )
}

export def "run" [--quiet (-q)]: string -> nothing {
    let out = run-external --redirect-stdout "pwsh" "-c" $in
    if ($quiet) { null } else { $out }
}
