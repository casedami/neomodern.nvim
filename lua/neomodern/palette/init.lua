local M = {}
local Util = require("neomodern.util")

---@class neomodern.PaletteBase16
---@field black string
---@field red string
---@field green string
---@field yellow string
---@field blue string
---@field magenta string
---@field cyan string
---@field white string
---@field bright_black string
---@field bright_red string
---@field bright_green string
---@field bright_yellow string
---@field bright_blue string
---@field bright_magenta string
---@field bright_cyan string
---@field bright_white string

---@class neomodern.PalettePreSpec
---@field alt string highlight
---@field bg string
---@field comment string
---@field constant string
---@field fg string
---@field func string
---@field keyword string
---@field line string (e.g. cursor line)
---@field number string number/boolean
---@field operator string
---@field property string class properties
---@field string string
---@field type string

---@class neomodern.PaletteSpec
---@field alt string highlight
---@field dim string
---@field bg string
---@field comment string
---@field constant string
---@field fg string
---@field func string
---@field keyword string
---@field line string (e.g. cursor line)
---@field number string number/boolean
---@field operator string
---@field property string class properties
---@field string string
---@field type string
---@field visual string visual selection
---@field diag_red string (e.g. error)
---@field diag_blue string (e.g. hint)
---@field diag_yellow string (e.g. warning)
---@field diag_green string (e.g. diffadd)

---@class neomodern.PrePalette
---@field base16 neomodern.PaletteBase16
---@field spec neomodern.PalettePreSpec

---@class neomodern.Palette
---@field base16 neomodern.PaletteBase16
---@field spec neomodern.PaletteSpec

local DiagnosticPalette = {
	diag_red = "#e67e80",
	diag_blue = "#86a3f0",
	diag_yellow = "#ad9368",
	diag_green = "#658c6d",
}

---@param base neomodern.PaletteBase16
---@return table
local function generate_diagnostic_colors(base)
	return {
		diag_red = Util.blend(DiagnosticPalette.diag_red, 0.8, base.red),
		diag_blue = Util.blend(DiagnosticPalette.diag_blue, 0.8, base.blue),
		diag_yellow = Util.blend(DiagnosticPalette.diag_yellow, 0.8, base.yellow),
		diag_green = Util.blend(DiagnosticPalette.diag_green, 0.8, base.green),
	}
end

---@param c string
---@return table
local function generate_visual_sel_bg(c)
	return { visual = Util.lighten(c, 0.08) }
end

---@param bg string
---@param type neomodern.Background
---@return string
local function resolve_bg(bg, type)
	local backgrounds = {
		default = bg,
		alt = Util.blend(bg, 0.75, "#000000"),
		transparent = "none",
	}
	local result = type and backgrounds[type] or backgrounds.default
	if result == nil then
		vim.schedule(function()
			vim.notify(string.format("Neomodern: unknown background type -- %s", type), vim.log.levels.WARN, {})
		end)
	end
	return result or backgrounds.default
end

local function resolve_dim(bg)
	return bg == "none" and "none" or Util.darken(bg, 0.15)
end

---@param theme neomodern.Theme
---@param bg_type neomodern.Background
---@param overrides neomodern.DefaultOverride
---@return neomodern.Palette
M.get = function(theme, bg_type, overrides)
	local colors
	if vim.o.background == "light" then
		---@type neomodern.PrePalette
		colors = require("neomodern.palette.light").get(theme)
	else
		---@type neomodern.PrePalette
		colors = require("neomodern.palette." .. theme)
	end
	colors.spec.bg = resolve_bg(colors.spec.bg, bg_type)

	return {
		spec = vim.tbl_extend(
			"force",
			colors.spec,
			{ dim = resolve_dim(colors.spec.bg) },
			generate_visual_sel_bg(colors.base16.black),
			generate_diagnostic_colors(colors.base16),
			overrides or {}
		),
		base16 = colors.base16,
	}
end

---@enum
M.themes = {
	moon = "moon",
	iceclimber = "iceclimber",
	gyokuro = "gyokuro",
	hojicha = "hojicha",
	roseprime = "roseprime",
}

return M
