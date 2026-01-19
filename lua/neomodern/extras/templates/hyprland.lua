---@type neomodern.Extra
local M = {
    name = "hyprland",
    ext = "conf",
    url = "https://github.com/hyprwm/Hyprland",
    template = [=[
# name: ${theme} colors for hyprland
# url: ${url}                        
# upstream: ${upstream}              
# author: Casey Miller               

# 1. copy into ~/.config/hypr/
# 2. include at the top of your hyprland.conf:
#       source=~/.config/hypr/${theme}.conf
# 3. use colors in your hyprland.conf, e.g.:
#       non-alpha:  $COLOR (e.g. $func) 
#       alpha:      rgba($COLORAlpha<transparency> 
#                   (e.g. rgba($funcAlphaee) 

$alt = rgb(${alt})
$altAlpha = ${alt}

$bg = rgb(${bg})
$bgAlpha = ${bg}

$comment = rgb(${comment})
$commentAlpha = ${comment}

$constant = rgb(${constant})
$constantAlpha = ${constant}

$fg = rgb(${fg})
$fgAlpha = ${fg}

$func = rgb(${func})
$funcAlpha = ${func}

$keyword = rgb(${keyword})
$keywordAlpha = ${keyword}

$line = rgb(${line})
$lineAlpha = ${line}

$number = rgb(${number})
$numberAlpha = ${number}

$operator = rgb(${operator})
$operatorAlpha = ${operator}

$property = rgb(${property})
$propertyAlpha = ${property}

$string = rgb(${string})
$stringAlpha = ${string}

$type = rgb(${type})
$typeAlpha = ${type}

$visual = rgb(${visual})
$visualAlpha = ${visual}

$diag_red = rgb(${diag_red})
$diag_redAlpha = ${diag_red}

$diag_blue = rgb(${diag_blue})
$diag_blueAlpha = ${diag_blue}

$diag_yellow = rgb(${diag_yellow})
$diag_yellowAlpha = ${diag_yellow}

$diag_green = rgb(${diag_green})
$diag_greenAlpha = ${diag_green}
]=],
}

return M
