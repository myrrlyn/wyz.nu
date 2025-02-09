use std log

use utils.nu ["or-else"]
use sys.nu ["geoip"]
use pwsh.nu
use term
use theme.nu
use vscode.nu

const szgic = {
    lat:  43.00701389364397
    lng: -89.45904406165236
    tzid: "America/Chicago"
}

export def --env "set" [
    --work (-w),
    --theme (-t): string,
    location?: record<lat: number, lng: number, tzid: string>,
] {
    let t: bool = if ($theme == "light") {
        true
    } else if ($theme == "dark") {
        false
    } else {
        if ($work) {
            log info "Using office location"
            $szgic
        } else {
            $location
        } | or-else {
            ( geoip
            | select latitude longitude time_zone.name
            | rename lat lng tzid
            )
        } | daytime
    }
    let n = if ($t) { "light" } else { "dark" }
    log info $"Setting system theme to ($n)"
    $t | pwsh gen color | pwsh run -q
    log info $"Setting nu theme to ($n)"
    $env.config.color_config = ($t | theme update-builtin)
    if (($nu).os-info.name == "windows") {
        $t | term windows theme
    }
    vscode rainglow -t $theme
    log info "Done"
}

export def "twilights" [
    --location (-l): record<lat: number, lng: number, tzid: string>,
    --time (-t): datetime
] {
    let loc = $location | or-else { geoip }
    let time = $time | or-else { date now }
    let day = $time | format date "%Y-%m-%d"
    log info $"Sun lookup for ($day)"
    let rsp = http get $"https://api.sunrise-sunset.org/json?lat=($loc.lat)&lng=($loc.lng)&tzid=($loc.tzid)&date=($day)"
    if ($rsp.status != "OK") {
        log error "could not retrieve twilight information"
        return
    }
    ( $rsp
    | get results
    | reject day_length
    | transpose event time
    | update event { str replace "twilight_begin" "dawn" }
    | update event { str replace "twilight_end" "dusk" }
    | update time { into datetime }
    | sort-by time
    )
}

export def "daytime" [time?: datetime] {
    let loc = $in | or-else { $szgic }
    let time = $time | or-else { date now }
    let events = (
        twilights --location $loc --time $time
        | where time >= $time
        | get event
    )
    if ($events | find sunrise | is-not-empty) {
        false
    } else if ($events | find sunset | is-not-empty) {
        true
    } else {
        false
    }
}
