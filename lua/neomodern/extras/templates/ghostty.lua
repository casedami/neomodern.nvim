---@type neomodern.Extra
local M = {
    name = "ghostty",
    ext = nil,
    url = "https://github.com/ghostty-org/ghostty",
    template = [=[
# name: ${theme} colors for ghostty
# url: ${url}
# upstream: ${upstream}
# author: Casey Miller

palette = 0=#${black}
palette = 1=#${red}
palette = 2=#${green}
palette = 3=#${yellow}
palette = 4=#${blue}
palette = 5=#${magenta}
palette = 6=#${cyan}
palette = 7=#${white}
palette = 8=#${bright_black}
palette = 9=#${bright_red}
palette = 10=#${bright_green}
palette = 11=#${bright_yellow}
palette = 12=#${bright_blue}
palette = 13=#${bright_magenta}
palette = 14=#${bright_cyan}
palette = 15=#${bright_white}
background = #${bg}
foreground = #${fg}
cursor-color = #${fg}
selection-background = #${visual}
selection-foreground = #${type}
]=],
}

return M
