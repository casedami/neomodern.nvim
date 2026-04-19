local Util = require("neomodern.util")

local M = {}

local core = {
	black = "#151515",
	red = "#a8685d",
	green = "#93c98f",
	yellow = "#ccc074",
	blue = "#6e86c2",
	magenta = "#665566",
	cyan = "#7a8aa6",
	cyan2 = "#DEEEED",
	gray1 = "#aeb1b5",
	gray2 = "#75757d",
	gray3 = "#555555",
	white = "#E1E1E1",
	white2 = "#f0f2f5",
}

---@type neomodern.PaletteBase16
M.base16 = {
	black = "#151515",
	red = Util.darken(core.red, 0.2),
	green = Util.darken(core.green, 0.2),
	yellow = Util.darken(core.yellow, 0.2),
	blue = Util.darken(core.blue, 0.2),
	magenta = core.magenta,
	cyan = core.cyan,
	white = core.gray2,
	bright_black = Util.lighten(core.black, 0.035),
	bright_red = core.red,
	bright_green = core.green,
	bright_yellow = core.yellow,
	bright_blue = core.blue,
	bright_magenta = Util.lighten(core.magenta, 0.2),
	bright_cyan = core.cyan2,
	bright_white = core.white,
}

---@type neomodern.PalettePreSpec
M.spec = {
	alt = M.base16.bright_cyan,
	bg = M.base16.black,
	comment = M.base16.magenta,
	constant = core.white2,
	fg = M.base16.bright_white,
	func = core.gray2,
	keyword = core.gray1,
	line = M.base16.bright_black,
	number = M.base16.bright_yellow,
	operator = M.base16.bright_cyan,
	property = core.gray3,
	string = M.base16.bright_green,
	type = M.base16.bright_blue,
}

return M
