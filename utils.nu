export def identity []: any -> any {
    $in
}

export def has-column [name: string]: table -> bool {
    get -i $name | is-not-empty
}

export def has-row [name: string]: table<name: string> -> bool {
    where name == $name | is-not-empty
}

export def or-else [block: closure]: any -> any {
    if ($in == null) {
        do $block
    } else {
        identity
    }
}

export def try-rename [from: string, to: string]: [record -> record, table -> table] {
    $in | if ($in | has-column $from) {
        rename { $from: $to }
    } else {
        identity
    }
}

# Updates a column in a table, if and only if it actually exists.
export def try-update [name: string, block: any]: [record -> record, table -> table] {
    $in | if ($in | has-column $name) {
        update $name $block
    } else {
        identity
    }
}
