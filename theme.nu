# Sets the nu color theme

use utils.nu ["or-else"]

export const builtins = {
    dark: {
        # color for nushell primitives
        separator: white
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: green_bold
        empty: blue
        # Closures can be used to choose colors for specific values.
        # The value (in this case, a bool) is piped into the closure.
        # eg) {|| if $in { 'light_cyan' } else { 'light_gray' } }
        bool: light_cyan
        int: white
        filesize: cyan
        duration: white
        date: purple
        range: white
        float: white
        string: white
        nothing: white
        binary: white
        cell-path: white
        row_index: green_bold
        record: white
        list: white
        block: white
        hints: dark_gray
        search_result: { bg: red, fg: white }
        shape_and: purple_bold
        shape_binary: purple_bold
        shape_block: blue_bold
        shape_bool: light_cyan
        shape_closure: green_bold
        shape_custom: green
        shape_datetime: cyan_bold
        shape_directory: cyan
        shape_external: cyan
        shape_externalarg: green_bold
        shape_external_resolved: light_yellow_bold
        shape_filepath: cyan
        shape_flag: blue_bold
        shape_float: purple_bold
        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: white, bg: red, attr: b}
        shape_globpattern: cyan_bold
        shape_int: purple_bold
        shape_internalcall: cyan_bold
        shape_keyword: cyan_bold
        shape_list: cyan_bold
        shape_literal: blue
        shape_match_pattern: green
        shape_matching_brackets: { attr: u }
        shape_nothing: light_cyan
        shape_operator: yellow
        shape_or: purple_bold
        shape_pipe: purple_bold
        shape_range: yellow_bold
        shape_record: cyan_bold
        shape_redirection: purple_bold
        shape_signature: green_bold
        shape_string: green
        shape_string_interpolation: cyan_bold
        shape_table: blue_bold
        shape_variable: purple
        shape_vardecl: purple
    },
    light: {
        # color for nushell primitives
        separator: dark_gray
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: green_bold
        empty: blue
        # Closures can be used to choose colors for specific values.
        # The value (in this case, a bool) is piped into the closure.
        # eg) {|| if $in { 'dark_cyan' } else { 'dark_gray' } }
        bool: dark_cyan
        int: dark_gray
        filesize: cyan_bold
        duration: dark_gray
        date: purple
        range: dark_gray
        float: dark_gray
        string: dark_gray
        nothing: dark_gray
        binary: dark_gray
        cell-path: dark_gray
        row_index: green_bold
        record: dark_gray
        list: dark_gray
        block: dark_gray
        hints: dark_gray
        search_result: { fg: white, bg: red }
        shape_and: purple_bold
        shape_binary: purple_bold
        shape_block: blue_bold
        shape_bool: light_cyan
        shape_closure: green_bold
        shape_custom: green
        shape_datetime: cyan_bold
        shape_directory: cyan
        shape_external: cyan
        shape_externalarg: green_bold
        shape_external_resolved: light_purple_bold
        shape_filepath: cyan
        shape_flag: blue_bold
        shape_float: purple_bold
        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: white, bg: red, attr: b}
        shape_globpattern: cyan_bold
        shape_int: purple_bold
        shape_internalcall: cyan_bold
        shape_keyword: cyan_bold
        shape_list: cyan_bold
        shape_literal: blue
        shape_match_pattern: green
        shape_matching_brackets: { attr: u }
        shape_nothing: light_cyan
        shape_operator: yellow
        shape_or: purple_bold
        shape_pipe: purple_bold
        shape_range: yellow_bold
        shape_record: cyan_bold
        shape_redirection: purple_bold
        shape_signature: green_bold
        shape_string: green
        shape_string_interpolation: cyan_bold
        shape_table: blue_bold
        shape_variable: purple
        shape_vardecl: purple
    },
}

export const nuthemes = {
    dark: [
        "3024-night", "3024r", "abyss", "aci", "aco", "adventuretime",
        "afterglow", "alien-blood", "alucard", "amora", "apathy", "apprentice",
        "argonaut", "arthur", "ashes", "atelier-cave", "atelier-dune",
        "atelier-estuary", "atelier-forest", "atelier-heath",
        "atelier-lakeside", "atelier-plateau", "atelier-savanna",
        "atelier-seaside", "atelier-sulphurpool", "atlas", "atom",
        "ayu-mirage-simple-cursor", "ayu-mirage", "ayu", "azu", "batman",
        "belafonte-night", "bespin", "bim", "birds-of-paradise",
        "black-metal-bathory", "black-metal-burzum", "black-metal-dark-funeral",
        "black-metal-gorgoroth", "black-metal-immortal", "black-metal-khold",
        "black-metal-marduk", "black-metal-mayhem", "black-metal-nile",
        "black-metal-venom", "black-metal", "blazer", "borland", "brewer",
        "bright-lights", "bright", "broadcast", "brogrammer", "brushtrees-dark",
        "c64", "cai", "catppuccin-latte", "catppuccin-mocha", "chalk",
        "chalkboard", "challenger-deep", "ciapre", "circus", "classic-dark",
        "clone-of-ubuntu", "cobalt-neon", "cobalt2", "codeschool", "corvine",
        "crayon-pony-fish", "danqing", "darcula", "dark-pastel", "darkmoss",
        "darkside", "darktooth", "darkviolet", "decaf", "default-dark",
        "desert-night", "desert", "dimmed-monokai", "dot-gov", "dracula",
        "dumbledore", "duotone-dark", "e-n-c-o-m", "earthsong", "edge-dark",
        "eighties", "elemental", "elementary", "elic", "elio", "embark",
        "embers", "equilibrium-dark", "equilibrium-gray-dark", "espresso-libre",
        "espresso", "eva-dim", "eva", "everforest", "falcon", "farin", "ffive",
        "fideloper", "fishtank", "flat", "flatland", "floraverse",
        "forest-night", "foxnightly", "framer", "freya", "frontend-delight",
        "frontend-fun-forrest", "frontend-galaxy", "gigavolt",
        "github-dark-colorblind", "github-dark-default", "github-dark",
        "github-dimmed", "glacier", "goa-base", "gooey", "google-dark", "grape",
        "grass", "grayscale-dark", "green-screen", "greenscreen", "gruvbit",
        "gruvbox-dark-hard", "gruvbox-dark-medium", "gruvbox-dark-pale",
        "gruvbox-dark-soft", "gruvbox-dark", "gruvbox-material-dark-hard",
        "gruvbox-material-dark-medium", "gruvbox-material-dark-soft",
        "gruvbox-mix-dark-hard", "gruvbox-mix-dark-medium",
        "gruvbox-mix-dark-soft", "gruvbox-original-dark-hard",
        "gruvbox-original-dark-medium", "gruvbox-original-dark-soft", "gruvbox",
        "hardcore", "harmonic-dark", "harmonic16-dark", "harper", "heetch",
        "helios", "hemisu-dark", "highway", "hipster-green", "homebrew",
        "hopscotch", "horizon-dark", "horizon-terminal-dark", "humanoid-dark",
        "hurtado", "hybrid", "ia-dark", "ibm3270", "ic-green-ppl",
        "ic-orange-ppl", "icy", "idle-toes", "idm_3b", "ir-black", "irblack",
        "isotope", "jackie-brown", "japanesque", "jellybeans",
        "jet-brains-darcula", "jup", "kibble", "kimber", "later-this-evening",
        "lavandula", "liquid-carbon-transparent", "liquid-carbon",
        "london-tube", "macintosh", "maia", "marrakesh", "materia",
        "material-dark", "material-darker", "material-palenight",
        "material-vivid", "material", "mathias", "medallion", "mellow-purple",
        "miramare", "misterioso", "miu", "mocha", "molokai", "mona-lisa",
        "mono-amber", "mono-cyan", "mono-green", "mono-red", "mono-white",
        "mono-yellow", "monokai-dark", "monokai-soda", "monokai",
        "mountaineer-grey", "mountaineer", "n0tch2k", "nebula", "neon-night",
        "neopolitan", "nep", "neutron", "nightfly", "nightlion-v1",
        "nightlion-v2", "nighty", "nord-alt", "nord", "nova", "nushell-dark",
        "obsidian", "ocean-dark", "ocean", "oceanic-material", "oceanic-next",
        "oceanicnext", "ollie", "one-dark", "one-half-black", "onedark",
        "orbital", "outrun-dark", "pali", "palmtree", "papercolor-dark",
        "paraiso-dark", "paraiso", "pasque", "paul-millr", "pencil-dark",
        "peppermint", "phd", "pico", "pnevma", "pop", "porple",
        "preview-generate-script", "preview-screenshot-script",
        "preview-terminal", "preview-theme", "pro", "railscasts", "rebecca",
        "red-alert", "red-sands", "relaxed-afterglow", "rippedcasts",
        "rose-pine-moon", "rose-pine", "royal", "sandcastle", "sat",
        "sea-shells", "seafoam-pastel", "selenized-black", "selenized-dark",
        "seoul256", "seti-ui", "seti", "shaman", "shel", "sierra", "silk-dark",
        "slate", "smyck", "snazzy", "snow-dark", "soft-server", "solar-flare",
        "solarflare", "solarized-darcula", "solarized-dark-higher-contrast",
        "solarized-dark", "source-code-x", "sourcerer", "sourcerer2",
        "spaceduck", "spacedust", "spacegray-eighties-dull",
        "spacegray-eighties", "spacegray", "spacemacs", "spiderman", "spring",
        "square", "srcery", "substrata", "summercamp", "summerfruit-dark",
        "sundried", "symphonic", "synth-midnight-dark", "tango-dark", "tango",
        "teerb", "tempus-autumn", "tempus-classic", "tempus-dusk",
        "tempus-fugit", "tempus-future", "tempus-night", "tempus-rift",
        "tempus-spring", "tempus-summer", "tempus-tempest", "tempus-warp",
        "tempus-winter", "tender", "terminix-dark", "thayer-bright", "the-hulk",
        "tin", "tokyo-moon", "tokyo-night", "tokyo-storm",
        "tomorrow-night-blue", "tomorrow-night-bright",
        "tomorrow-night-eighties", "tomorrow-night", "toy-chest", "treehouse",
        "tube", "twilight", "two-firewatch", "unikitty-dark", "urple", "vag",
        "vaughn", "vibrant-ink", "vs-code-dark-plus", "vulcan", "warm-neon",
        "wez", "wild-cherry", "windows-10", "windows-95",
        "windows-highcontrast", "windows-nt", "wombat", "woodland", "wryan",
        "xcode-dusk", "yachiyo", "zenburn",
    ],
    light: [
        "3024-day", "atelier-cave-light", "atelier-dune-light",
        "atelier-estuary-light", "atelier-forest-light", "atelier-heath-light",
        "atelier-lakeside-light", "atelier-plateau-light",
        "atelier-savanna-light", "atelier-seaside-light",
        "atelier-sulphurpool-light", "atom-one-light", # "ayu-light",
        "belafonte-day", "brushtrees", "classic-light", "clrs", "cupcake",
        "cupertino", "default-light", "dirtysea", "edge-light",
        "equilibrium-gray-light", "equilibrium-light", "everforest-light",
        "fruit-soda", "github-light-colorblind", "github-light-default",
        "github-light", "github", "google-light", "grayscale-light",
        "gruvbox-light-hard", "gruvbox-light-medium", "gruvbox-light-soft",
        "gruvbox-material-light-hard", "gruvbox-material-light-medium",
        "gruvbox-material-light-soft", "gruvbox-mix-light-hard",
        "gruvbox-mix-light-medium", "gruvbox-mix-light-soft",
        "gruvbox-original-light-hard", "gruvbox-original-light-medium",
        "gruvbox-original-light-soft", "harmonic-light", "harmonic16-light",
        "heetch-light", "hemisu-light", "horizon-light", "horizon-terminal-light",
        "humanoid-light", "ia-light", "iceberg-light", "man-page", "mar",
        "material-lighter", "mexico-light", "nord-light", "novel",
        "nushell-light", "one-half-light", "one-light", "papercolor-light",
        "pencil-light",
        # "piatto-light",
        "renault-style-light", "rose-pine-dawn",
        "sagelight", "selenized-light", "selenized-white", "shapeshifter",
        "silk-light", "snow-light", "solarflare-light", "solarized-light",
        "summerfruit-light", "synth-midnight-light", "tango-light",
        "tempus-dawn", "tempus-day", "tempus-past", "tempus-totus",
        "terminal-basic", "tokyo-day", "tomorrow", "unikitty-light", "ura",
        "windows-10-light", "windows-95-light", "windows-highcontrast-light",
        "windows-nt-light",
    ]
}

export def rand []: bool -> string {
    let kind = $in | or-else { true }
    if ($kind) {
        ($nuthemes).light
    } else {
        ($nuthemes.dark)
    } | shuffle | first
}

export def --env update-dyn [name: string] {
    let name = $name | or-else { rand }
    ( open $"($nu.default-config-dir)/wyz/theme-dyn.tmpl.nu"
    | str replace -a "@THEME@" $name
    | save -f $"($nu.default-config-dir)/wyz/theme-dyn.nu"
    )
    export-env { use $"($nu.default-config-dir)/wyz/theme-dyn.nu" }
}

export def --env update-builtin []: [bool -> record, nothing -> record] {
    let light = $in | or-else { true }
    let theme = if ($light) {
        $builtins.light
    } else {
        $builtins.dark
    }
    export-env {
        $env.config.color_config = $theme
    }
    $theme
}
