use std log

use utils.nu ["identity", "has-row", "try-rename", "try-update"]

# Open a `CMake{,User}Presets.json` file
def "presets open" [--user (-u)]: nothing -> record {
    ( $"CMake(if ($user) { "User" } else { "" })Presets.json"
    | if ($in | path exists) { open } else { {} }
    )
}

def "presets fillout" []: record -> record<configurePresets: table, buildPresets: table, testPresets: table, packagePresets: table, workflowPresets: table> {
    ( default [] configurePresets
    | default [] buildPresets
    | default [] testPresets
    | default [] packagePresets
    | default [] workflowPresets
    | move buildPresets --after configurePresets
    | move testPresets --after buildPresets
    | move packagePresets --after testPresets
    | move workflowPresets --after packagePresets
    )
}

def "presets join" [rhs: record]: record -> record<configurePresets: table, buildPresets: table, testPresets: table, packagePresets: table, workflowPresets: table> {
    let rhs = $rhs | presets fillout
    ( $in
    | presets fillout
    | try-update configurePresets { append $rhs.configurePresets? }
    | try-update buildPresets { append $rhs.buildPresets? }
    | try-update testPresets { append $rhs.testPresets? }
    | try-update packagePresets { append $rhs.packagePresets? }
    )
}

def "presets hide" []: record -> record {
    let hider = { |row| $row | default false hidden | filter { not $in.hidden } }
    ( $in
    | try-update configurePresets $hider
    | try-update buildPresets $hider
    | try-update testPresets $hider
    | try-update packagePresets $hider
    )
}

def "build-presets get" [name: string]: [record -> record<name: string>, record -> nothing] {
    $in | get buildPresets | where name == $name | get -i 0
}

def "build-presets get-configuration" [name: string]: record -> string {
    let this = build-presets get $name
    if ($this | has-column configurePreset) {
        return $this | get configurePreset
    }
    $this | get inherits | reduce --fold null { |it, acc| if ($acc != null) {
        $acc
    } else {
        $in | build-presets get-configuration $it
    } }
}

export def "presets list" [kind?: string, --all (-a)]: nothing -> record {
    ( presets open
    | presets join (presets open --user)
    | if (not $all) { presets hide } else { identity }
    | if ($kind != null) { get $"($kind)Presets" } else { identity }
    )
}

export def "presets configure" [name: string] {
    ( presets list
    | get configurePresets
    | if ($in | has-row $name) {
        ^cmake --preset $name | print
    } else {
        log warning $"No such configure preset: ($name)"
    }
    )
}

export def "presets build" [name: string] {
    let all = presets list
    let cfg = $all | build-presets get-configuration $name
    if ($cfg != null) {
        ^cmake --preset $cfg | print
    } else {
        log error $"Build Preset ($name) has no Configuration Preset"
        return
    }
    ^cmake --build --preset $name | print
}
