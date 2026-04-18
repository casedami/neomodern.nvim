local Util = require("neomodern.util")

local M = {}

local core = {
	black = "#141517",
	red = "#d9829b",
	green = "#9bbdb8",
	orange = "#ebbcba",
	yellow = "#c9aa95",
	blue = "#96aff2",
	magenta = "#c4a7e7",
	cyan = "#6591bf",
	white = "#e0def4",
	gray = "#6e6a86",
}

---@type neomodern.PrePalette.Base
M.base = {
	black = core.black,
	red = core.red,
	green = Util.darken(core.green, 0.2),
	yellow = core.orange,
	blue = core.blue,
	magenta = Util.darken(core.magenta, 0.2),
	cyan = core.cyan,
	white = core.gray,
	bright_black = Util.lighten(M.base.black, 0.035),
	bright_red = Util.lignten(core.red, 0.2),
	bright_green = core.green,
	bright_yellow = core.yellow,
	bright_blue = Util.darken(core.magenta, 0.2),
	bright_magenta = core.magenta,
	bright_cyan = Util.lighten(core.cyan, 0.4),
	bright_white = core.white,
}

---@type neomodern.PrePalette.Spec
M.spec = {
	alt = M.base.bright_cyan,
	bg = M.base.black,
	comment = M.base.white,
	constant = M.base.blue,
	fg = M.base.white,
	func = M.base.bright_magenta,
	keyword = M.base.cyan,
	line = M.base.bright_black,
	number = M.base.yellow,
	operator = M.base.magenta,
	property = M.base.red,
	string = M.base.bright_yellow,
	type = M.base.bright_green,
	visual = Util.lighten(M.base.black, 0.08),
}

return M
