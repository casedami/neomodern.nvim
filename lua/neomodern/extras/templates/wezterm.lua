---@type neomodern.Extra
local M = {
    name = "wezterm",
    ext = "toml",
    url = "https://wezfurlong.org/wezterm/config/files.html",
    template = [=[
[colors]
foreground = "#${fg}"
background = "#${bg}"
cursor_bg = "#${fg}"
cursor_border = "#${comment}"
cursor_fg = "#${bg}"
selection_bg = "#${visual}"
selection_fg = "#${type}"
split = "#${comment}"
compose_cursor = "#${alt}"
scrollbar_thumb = "#${line}"

ansi = ["#${black}", "#${red}", "#${green}", "#${yellow}", "#${blue}", "#${magenta}", "#${cyan}", "#${white}"]
brights = ["#${bright_black}", "#${bright_red}", "#${bright_green}", "#${bright_yellow}", "#${bright_blue}", "#${bright_magenta}", "#${bright_cyan}", "#${bright_white}"]

[colors.tab_bar]
inactive_tab_edge = "#${white}"
background = "#${bg}"

[colors.tab_bar.active_tab]
fg_color = "#${alt}"
bg_color = "#${visual}"

[colors.tab_bar.inactive_tab]
fg_color = "#${comment}"
bg_color = "#${line}"

[colors.tab_bar.inactive_tab_hover]
fg_color = "#${comment}"
bg_color = "#${line}"
# intensity = "Bold"

[colors.tab_bar.new_tab_hover]
fg_color = "#${alt}"
bg_color = "#${visual}"
intensity = "Bold"

[colors.tab_bar.new_tab]
fg_color = "#${alt}"
bg_color = "#${bg}"

[metadata]
aliases = []
name = "${theme}"
url = "${url}"
upstream = "${upstream}"
author = "Casey Miller"
]=],
}

return M
