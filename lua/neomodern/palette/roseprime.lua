local Util = require("neomodern.util")

local M = {}
local fg_bias = "#ffecff"

---@type neomodern.PrePalette.Base
M.base = {
    black = "#141517",
    red = "#c4959c",
    green = "#9bbdb8",
    yellow = "#c9aa95",
    blue = "#96aff2",
    magenta = "#a6a4eb",
    cyan = "#5f86b0",
}

---@type neomodern.PrePalette.Spec
M.spec = {
    alt = Util.lighten(M.base.cyan, 0.4),
    bg = M.base.black,
    comment = Util.blend(M.base.black, 0.65, fg_bias),
    constant = M.base.blue,
    fg = Util.blend(M.base.black, 0.25, fg_bias),
    func = M.base.red,
    keyword = M.base.cyan,
    line = Util.lighten(M.base.black, 0.035),
    number = Util.darken(M.base.yellow, 0.2),
    operator = Util.darken(M.base.magenta, 0.1),
    property = Util.darken(M.base.red, 0.2),
    string = M.base.yellow,
    type = M.base.green,
    visual = Util.lighten(M.base.black, 0.08),
}

return M
