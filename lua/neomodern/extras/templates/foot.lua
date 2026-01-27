---@type neomodern.Extra
local M = {
    name = "foot",
    ext = "ini",
    url = "https://codeberg.org/dnkl/foot",
    template = [=[
# name: ${theme} colors for foot
# url: ${url}
# upstream: ${upstream}
# author: Casey Miller

[colors]
cursor=${fg} ${visual}
foreground=${fg}
background=${bg}
selection-foreground=${fg}
selection-background=${visual}
urls=${blue}

regular0=${black}
regular1=${red}
regular2=${green}
regular3=${yellow}
regular4=${blue}
regular5=${magenta}
regular6=${cyan}
regular7=${white}

bright0=${bright_black}
bright1=${bright_red}
bright2=${bright_green}
bright3=${bright_yellow}
bright4=${bright_blue}
bright5=${bright_magenta}
bright6=${bright_cyan}
bright7=${bright_white}

16=${alt}
]=],
}

return M
