local Util = require("neomodern.util")

local M = {}
local fg_bias = "#eeeeff"

---@type neomodern.PrePalette.Base
M.base = {
    black = "#111111",
    red = "#ab836c",
    green = "#777d77",
    yellow = "#b5b3a5",
    blue = "#858599",
    magenta = "#817882",
    cyan = "#6d748c",
}

---@type neomodern.PrePalette.Spec
M.spec = {
    alt = Util.blend(M.base.black, 0.2, fg_bias),
    bg = M.base.black,
    comment = "#4c4c57",
    constant = M.base.yellow,
    fg = Util.blend(M.base.black, 0.35, fg_bias),
    func = Util.darken(M.base.blue, 0.2),
    keyword = M.base.blue,
    line = Util.lighten(M.base.black, 0.035),
    number = M.base.red,
    operator = Util.darken(M.base.cyan, 0.2),
    property = M.base.magenta,
    string = M.base.green,
    type = M.base.cyan,
    visual = Util.lighten(M.base.black, 0.08),
}

return M
