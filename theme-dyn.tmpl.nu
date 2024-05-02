# *** GENERATED FILE ***
#
# This is produced from theme-dyn.tmpl.nu, since nushell does not have a way to
# eval a string other than writing it to a file and `use`ing it, and the themes
# in nu-scripts all produce functions rather than records.

use "../nupm/modules/nu-themes/@THEME@.nu"
export-env {
    $env.config.color_config = (@THEME@)
}
