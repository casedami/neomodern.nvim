---@type neomodern.Extra
local M = {
    name = "alacritty",
    ext = "toml",
    url = "https://github.com/alacritty/alacritty",
    template = [=[
# name: ${theme} colors for alacritty
# url: ${url}
# upstream: ${upstream}
# author: Casey Miller

# Default colors
[colors.primary]
background = '#${bg}'
foreground = '#${fg}'

#[colors.cursor]
#cursor = '#${fg}'
#text = '#${bg}'

# Normal colors
[colors.normal]
black = '#${black}'
red = '#${red}'
green = '#${green}'
yellow = '#${yellow}'
blue = '#${blue}'
magenta = '#${magenta}'
cyan = '#${cyan}'
white = '#${white}'

# Bright colors
[colors.bright]
black = '#${bright_black}'
red = '#${bright_red}'
green = '#${bright_green}'
yellow = '#${bright_yellow}'
blue = '#${bright_blue}'
magenta = '#${bright_magenta}'
cyan = '#${bright_cyan}'
white = '#${bright_white}'
]=],
}

return M
