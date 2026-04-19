local Util = require("neomodern.util")

local M = {}

local core = {
	black = "#141517",
	red = "#c2748b",
	green = "#9bbdb8",
	orange = "#ebbcba",
	yellow = "#c9aa95",
	blue = "#96aff2",
	magenta = "#b197d1",
	cyan = "#6591bf",
	white = "#e0def4",
	gray = "#6e6a86",
}

---@type neomodern.PaletteBase16
M.base16 = {
	black = core.black,
	red = core.red,
	green = Util.darken(core.green, 0.2),
	yellow = core.orange,
	blue = core.blue,
	magenta = Util.darken(core.magenta, 0.2),
	cyan = core.cyan,
	white = core.gray,
	bright_black = Util.lighten(core.black, 0.035),
	bright_red = Util.lighten(core.red, 0.2),
	bright_green = core.green,
	bright_yellow = core.yellow,
	bright_blue = Util.darken(core.magenta, 0.2),
	bright_magenta = core.magenta,
	bright_cyan = Util.lighten(core.cyan, 0.4),
	bright_white = core.white,
}

---@type neomodern.PalettePreSpec
M.spec = {
	alt = M.base16.bright_cyan,
	bg = M.base16.black,
	comment = M.base16.white,
	constant = M.base16.blue,
	fg = M.base16.bright_white,
	func = M.base16.bright_magenta,
	keyword = M.base16.cyan,
	line = M.base16.bright_black,
	number = M.base16.yellow,
	operator = M.base16.magenta,
	property = M.base16.red,
	string = M.base16.bright_yellow,
	type = M.base16.bright_green,
	visual = Util.lighten(M.base16.black, 0.08),
}

return M
