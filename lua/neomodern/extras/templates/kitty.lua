---@type neomodern.Extra
local M = {
    name = "kitty",
    ext = "conf",
    url = "https://sw.kovidgoyal.net/kitty/conf.html",
    template = [=[
# vim:ft=kitty

# name: ${theme} colors for kitty
# url: ${url}
# upstream: ${upstream}
# author: Casey Miller

background #${bg}
foreground #${fg}
selection_background #${visual}
selection_foreground #${fg}
url_color #${blue}
cursor #${fg}
cursor_text_color #${bg}

# Tabs
active_tab_background #${visual}
active_tab_foreground #${alt}
inactive_tab_background #${line}
inactive_tab_foreground #${grey}
#tab_bar_background #${bg}

# Windows
active_border_color #${alt}
inactive_border_color #${comment}

# normal
color0 #${black}
color1 #${red}
color2 #${green}
color3 #${yellow}
color4 #${blue}
color5 #${magenta}
color6 #${cyan}
color7 #${white}

# bright
color8 #${bright_black}
color9 #${bright_red}
color10 #${bright_green}
color11 #${bright_yellow}
color12 #${bright_blue}
color13 #${bright_magenta}
color14 #${bright_cyan}
color15 #${bright_white}
]=],
}

return M
