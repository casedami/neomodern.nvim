---@type neomodern.Extra
local M = {
    name = "windows_terminal",
    ext = "json",
    url = "https://aka.ms/terminal-documentation",
    template = [=[
# Add the following object to your Windows Terminal configuration
# https://learn.microsoft.com/en-us/windows/terminal/customize-settings/color-schemes#creating-your-own-color-scheme
{
    "background": "#${bg}",
    "black": "#${black}",
    "red": "#${red}",
    "green": "#${green}",
    "yellow": "#${yellow}"
    "blue": "#${blue}",
    "purple": "#${magenta}",
    "cyan": "#${cyan}",
    "white": "#${white}",
    "brightBlack": "#${bright_black}",
    "brightRed": "#${bright_red}",
    "brightGreen": "#${bright_green}",
    "brightYellow": "#${bright_yellow}",
    "brightBlue": "#${bright_blue}",
    "brightPurple": "#${bright_magenta}",
    "brightCyan": "#${bright_cyan}",
    "brightWhite": "#${bright_white}",

    "foreground": "#${white}",
    "selectionBackground": "#${visual}",
    "cursorColor": "#${fg}",

    "name": "#${theme}",
}
]=],
}

return M
