local Util = require("neomodern.util")

local M = {}
local fg_bias = "#e9e9ff"

---@type neomodern.PrePalette.Base
M.base = {
    black = "#171719",
    red = "#cf9dbd",
    green = "#90aba0",
    yellow = "#cfa18c",
    blue = "#87a1e6",
    magenta = "#8a88d1",
    cyan = "#6a969c",
}

---@type neomodern.PrePalette.Spec
M.spec = {
    alt = Util.lighten(M.base.blue, 0.3),
    bg = M.base.black,
    comment = Util.blend(M.base.black, 0.65, fg_bias),
    constant = M.base.cyan,
    fg = Util.blend(M.base.black, 0.35, fg_bias),
    func = M.base.blue,
    keyword = M.base.magenta,
    line = Util.lighten(M.base.black, 0.035),
    number = M.base.yellow,
    operator = Util.darken(M.base.magenta, 0.2),
    property = M.base.red,
    string = M.base.green,
    type = Util.lighten(M.base.magenta, 0.4),
    visual = Util.lighten(M.base.black, 0.08),
}

return M
