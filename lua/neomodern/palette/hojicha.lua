local Util = require("neomodern.util")

local M = {}
local fg_bias = "#ffeaea"

---@type neomodern.PrePalette.Base
M.base = {
    black = "#171614",
    red = "#8a7f76",
    green = "#717d6e",
    yellow = "#b0a582",
    blue = "#808796",
    magenta = "#8a879c",
    cyan = "#ab836c",
}

---@type neomodern.PrePalette.Spec
M.spec = {
    alt = Util.lighten(M.base.green, 0.2),
    bg = M.base.black,
    comment = Util.blend(M.base.black, 0.65, fg_bias),
    constant = M.base.green,
    fg = Util.blend(M.base.black, 0.35, fg_bias),
    func = Util.darken(M.base.red, 0.2),
    keyword = M.base.red,
    line = Util.lighten(M.base.black, 0.035),
    number = M.base.cyan,
    operator = Util.darken(M.base.green, 0.2),
    property = M.base.blue,
    string = M.base.yellow,
    type = M.base.magenta,
    visual = Util.lighten(M.base.black, 0.08),
}

return M
