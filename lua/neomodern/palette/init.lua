local M = {}
local Util = require("neomodern.util")

---@class neomodern.PrePalette.Base
---@field black string
---@field red string
---@field green string
---@field yellow string
---@field blue string
---@field magenta string
---@field cyan string

---@class neomodern.PrePalette.Spec
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
---@field visual string visual selection

---@class neomodern.PrePalette
---@field base neomodern.PrePalette.Base
---@field spec neomodern.PrePalette.Spec

---@class neomodern.Palette.Base16
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

---@class neomodern.Palette.Spec
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
---@field visual string visual selection
---@field diag_red string (e.g. error)
---@field diag_blue string (e.g. hint)
---@field diag_yellow string (e.g. warning)
---@field diag_green string (e.g. diffadd)

---@class neomodern.Palette
---@field base16 neomodern.Palette.Base16
---@field spec neomodern.Palette.Spec

---@class neomodern.PrePalette.Diagnostics
---@field diag_red string
---@field diag_blue string
---@field diag_yellow string
---@field diag_green string

---@type neomodern.PrePalette.Diagnostics
local DiagnosticPalette = {
    diag_red = "#e67e80",
    diag_blue = "#86a3f0",
    diag_yellow = "#ad9368",
    diag_green = "#658c6d",
}

---@param colors neomodern.PrePalette
---@return neomodern.Palette.Base16
local function generate_base16(colors)
    return {
        black = colors.spec.line,
        red = Util.darken(colors.base.red, 0.2),
        green = Util.darken(colors.base.green, 0.2),
        yellow = Util.darken(colors.base.yellow, 0.2),
        blue = Util.darken(colors.base.blue, 0.2),
        magenta = Util.darken(colors.base.magenta, 0.2),
        cyan = Util.darken(colors.base.cyan, 0.2),
        white = Util.darken(colors.spec.fg, 0.4),
        bright_black = colors.spec.comment,
        bright_red = colors.base.red,
        bright_green = colors.base.green,
        bright_yellow = colors.base.yellow,
        bright_blue = colors.base.blue,
        bright_magenta = colors.base.magenta,
        bright_cyan = colors.base.cyan,
        bright_white = colors.spec.fg,
    }
end

---@param base neomodern.PrePalette.Base
---@return neomodern.PrePalette.Diagnostics
local function generate_diagnostic_colors(base)
    return {
        diag_red = Util.blend(DiagnosticPalette.diag_red, 0.8, base.red),
        diag_blue = Util.blend(DiagnosticPalette.diag_blue, 0.8, base.blue),
        diag_yellow = Util.blend(DiagnosticPalette.diag_yellow, 0.8, base.yellow),
        diag_green = Util.blend(DiagnosticPalette.diag_green, 0.8, base.green),
    }
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
            vim.notify(
                string.format("Neomodern: unknown background type -- %s", type),
                vim.log.levels.WARN,
                {}
            )
        end)
    end
    return result or backgrounds.default
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
            generate_diagnostic_colors(colors.base),
            overrides or {}
        ),
        base16 = generate_base16(colors),
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
