local Util = require("neomodern.util")

local M = {}
local fg_bias = "#fffff0"

---@type neomodern.PrePalette.Base
M.base = {
    black = "#1b1c1d",
    red = "#d6a9b3",
    green = "#799475",
    yellow = "#a69e6f",
    blue = "#748fa6",
    magenta = "#868db5",
    cyan = "#b08c7d",
}

---@type neomodern.PrePalette.Spec
M.spec = {
    alt = Util.lighten(M.base.green, 0.2),
    bg = M.base.black,
    comment = Util.blend(M.base.black, 0.65, fg_bias),
    constant = M.base.magenta,
    fg = Util.blend(M.base.black, 0.35, fg_bias),
    func = Util.darken(M.base.green, 0.2),
    keyword = M.base.green,
    line = Util.lighten(M.base.black, 0.035),
    number = M.base.red,
    operator = M.base.cyan,
    property = M.base.blue,
    string = M.base.yellow,
    type = Util.lighten(M.base.green, 0.4),
    visual = Util.lighten(M.base.black, 0.08),
}

return M
