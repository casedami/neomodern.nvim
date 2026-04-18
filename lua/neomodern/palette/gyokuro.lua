local Util = require("neomodern.util")

local M = {}
local fg_bias = "#fffff0"

local core = {
	black = "#1b1c1d",
	red = "#d6a9b3",
	green = "#799475",
	yellow = "#a69e6f",
	blue = "#748fa6",
	magenta = "#868db5",
	orange = "#b08c7d",
}

---@type neomodern.PrePalette.Base
M.base = {
	black = "#1b1c1d",
	red = Util.darken(core.red, 0.2),
	green = Util.darken(core.green, 0.2),
	yellow = core.orange,
	blue = core.blue,
	magenta = core.magenta,
	cyan = Util.lighten(core.green, 0.2),
	white = Util.blend(M.base.black, 0.35, fg_bias),
	bright_black = Util.lighten(core.black, 0.035),
	bright_red = core.red,
	bright_green = core.green,
	bright_yellow = core.yellow,
	bright_blue = Util.lighten(core.blue, 0.2),
	bright_magenta = Util.lighten(core.magenta, 0.2),
	bright_cyan = Util.lighten(core.green, 0.4),
	bright_white = Util.blend(core.black, 0.35, fg_bias),
}

---@type neomodern.PrePalette.Spec
M.spec = {
	alt = M.base.cyan,
	bg = M.base.black,
	comment = M.base.white,
	constant = M.base.magenta,
	fg = M.base.bright_white,
	func = M.base.green,
	keyword = M.base.bright_green,
	line = M.base.bright_black,
	number = M.base.bright_red,
	operator = M.base.yellow,
	property = M.base.blue,
	string = M.base.bright_yellow,
	type = M.base.bright_cyan,
	visual = Util.lighten(M.base.black, 0.08),
}

return M
