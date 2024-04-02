use std log

use utils.nu ["or-else"]

export def "ip addr v4" [] {
    log info "IPv4 lookup"
    http get https://ipv4.icanhazip.com
}

export def "geoip" [ip?: string] {
    let ip = $ip | or-else { ip addr v4 }
    log info "GeoIP lookup"
    let hdrs = {
        Accept: "application/json"
        Accept-Language: "en-US,en;q=0.5"
        Origin: "https://ipgeolocation.io"
        Referer: "https://ipgeolocation.io"
        Sec-Fetch-Dest: empty
        Sec-Fetch-Mode: cors
        Sec-Fetch-Site: "same-site"
        TE: trailers
        UserAgen: "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:124.0) Gecko/20100101 Firefox/124.0"
    } | transpose key value | each { [$in.key, $in.value] } | flatten
    http get -H $hdrs $"https://api.ipgeolocation.io/ipgeo?=($ip)"
}
