local Util = require("neomodern.util")

local M = {}
local fg_bias = "#ffeaea"

local core = {
	black = "#171614",
	red = "#9e6057",
	green = "#717d6e",
	orange = "#ab836c",
	yellow = "#b0a582",
	blue = "#808796",
	magenta = "#8a879c",
	cyan = "#8a7f76",
	gray = "#4f4c4c",
}

---@type neomodern.PaletteBase16
M.base16 = {
	black = core.black,
	red = Util.darken(core.red, 0.2),
	green = Util.darken(core.green, 0.2),
	yellow = core.orange,
	blue = Util.darken(core.blue, 0.2),
	magenta = Util.darken(core.magenta, 0.2),
	cyan = Util.darken(core.cyan, 0.2),
	white = core.gray,
	bright_black = Util.lighten(core.black, 0.035),
	bright_red = core.red,
	bright_green = core.green,
	bright_yellow = core.yellow,
	bright_blue = core.blue,
	bright_magenta = core.magenta,
	bright_cyan = core.cyan,
	bright_white = Util.blend(core.black, 0.35, fg_bias),
}

---@type neomodern.PalettePreSpec
M.spec = {
	alt = M.base16.bright_green,
	bg = M.base16.black,
	comment = M.base16.white,
	constant = M.base16.bright_red,
	fg = M.base16.bright_white,
	func = M.base16.cyan,
	keyword = M.base16.bright_cyan,
	line = M.base16.bright_black,
	number = M.base16.yellow,
	operator = M.base16.green,
	property = M.base16.bright_blue,
	string = M.base16.bright_yellow,
	type = M.base16.bright_magenta,
}

return M
