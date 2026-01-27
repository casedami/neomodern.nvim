---@type neomodern.Extra
local M = {
    name = "waybar",
    ext = "css",
    url = "https://github.com/Alexays/Waybar",
    template = [=[
/* name: ${theme} colors for waybar   */
/* url: ${url}                        */
/* upstream: ${upstream}              */
/* author: Casey Miller               */

/* 
1. copy into ~/.config/waybar/
2. include at the top of your style.css:
@import "${theme}.css";
3. use colors in your style.css, e.g.:
* {
color: @func
}
*/

@define-color alt #${alt};
@define-color bg #${bg};
@define-color comment #${comment};
@define-color constant #${constant};
@define-color fg #${fg};
@define-color func #${func};
@define-color keyword #${keyword};
@define-color line #${line};
@define-color number #${number};
@define-color operator #${operator};
@define-color property #${property};
@define-color string #${string};
@define-color type #${type};
@define-color visual #${visual};
@define-color diag_red #${diag_red};
@define-color diag_blue #${diag_blue};
@define-color diag_yellow #${diag_yellow};
@define-color diag_green #${diag_green};
]=],
}

return M
