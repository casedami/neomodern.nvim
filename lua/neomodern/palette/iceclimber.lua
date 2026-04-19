local Util = require("neomodern.util")

local M = {}
local fg_bias = "#e9e9ff"

local core = {
	black = "#171719",
	red = "#eba9d2",
	green = "#90aba0",
	yellow = "#cfa18c",
	blue = "#87a1e6",
	magenta = "#8a88d1",
	cyan = "#6a969c",
	white = "#e5e5ff",
}

---@type neomodern.PaletteBase16
M.base16 = {
	black = core.black,
	red = Util.darken(core.red, 0.2),
	green = Util.darken(core.green, 0.2),
	yellow = core.yellow,
	blue = core.blue,
	magenta = core.magenta,
	cyan = core.cyan,
	white = Util.blend(M.base16.black, 0.65, fg_bias),
	bright_black = Util.lighten(core.black, 0.035),
	bright_red = core.red,
	bright_green = core.green,
	bright_yellow = Util.lighten(core.yellow, 0.2),
	bright_blue = Util.lighten(core.blue, 0.3),
	bright_magenta = Util.lighten(core.magenta, 0.4),
	bright_cyan = Util.lighten(core.cyan, 0.2),
	bright_white = core.white,
}

---@type neomodern.PalettePreSpec
M.spec = {
	alt = M.base16.bright_blue,
	bg = M.base16.black,
	comment = M.base16.white,
	constant = M.base16.cyan,
	fg = M.base16.bright_white,
	func = M.base16.blue,
	keyword = M.base16.magenta,
	line = M.base16.bright_black,
	number = M.base16.yellow,
	operator = Util.darken(M.base16.magenta, 0.2),
	property = M.base16.bright_red,
	string = M.base16.bright_green,
	type = M.base16.bright_magenta,
}

return M
