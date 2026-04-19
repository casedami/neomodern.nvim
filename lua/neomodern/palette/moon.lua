local Util = require("neomodern.util")

local M = {}

local core = {
	black = "#151515",
	red = "#a8685d",
	green = "#93c98f",
	yellow = "#ccc074",
	blue = "#6e86c2",
	magenta = "#9c7894",
	cyan = "#7a8aa6",
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
	magenta = Util.darken(core.magenta, 0.2),
	cyan = Util.darken(core.cyan, 0.2),
	white = core.gray2,
	bright_black = Util.lighten(core.black, 0.035),
	bright_red = core.red,
	bright_green = core.green,
	bright_yellow = core.yellow,
	bright_blue = core.blue,
	bright_magenta = core.magenta,
	bright_cyan = core.cyan,
	bright_white = core.white,
}

---@type neomodern.PalettePreSpec
M.spec = {
	alt = M.base.bright_magenta,
	bg = M.base.black,
	comment = M.base.bright_red,
	constant = core.white2,
	fg = M.base.bright_white,
	func = core.gray2,
	keyword = core.gray1,
	line = M.base.bright_black,
	number = M.base.bright_yellow,
	operator = M.base.bright_cyan,
	property = core.gray3,
	string = M.base.bright_green,
	type = M.base.bright_blue,
}

return M
