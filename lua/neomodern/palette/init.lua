local M = {}
local Util = require("neomodern.util")

---@class neomodern.Theme
---@field alt string highlight
---@field alt_bg string dim alternate background
---@field bg string background
---@field comment string comments
---@field constant string constants
---@field fg string foreground
---@field func string functions
---@field keyword string keywords
---@field line string line highlights: e.g. cursor line
---@field number string number/boolean
---@field operator string operators
---@field property string class properties
---@field string string strings
---@field type string types
---@field visual string visual selection
---@field diag_red string diagnostics red color (e.g. error)
---@field diag_blue string diagnostics blue color (e.g. hint)
---@field diag_yellow string diagnostics yellow color (e.g. warning)
---@field diag_green string diagnostics green color (e.g. diffadd)
---@field colormap nil|neomodern.Theme.Terminal mapping to terminal colors

---@class neomodern.Theme.Terminal
---@field c00 string
---@field c01 string
---@field c02 string
---@field c03 string
---@field c04 string
---@field c05 string
---@field c06 string
---@field c07 string
---@field c08 string
---@field c09 string
---@field c0A string
---@field c0B string
---@field c0C string
---@field c0D string
---@field c0E string
---@field c0F string

---@enum Themes
M.themes = {
    iceclimber = "iceclimber",
    gyokuro = "gyokuro",
    hojicha = "hojicha",
    roseprime = "roseprime",
}

for key, theme in pairs(M.themes) do
    local palette = require("neomodern.palette." .. theme)
    palette.dim = Util.blend(palette.bg, 0.9, "#000000")
    M[key] = palette
end

---@class neomodern.PaletteOpts
---@field theme string
---@field variant string
---@field flat boolean | nil

---Returns an owned copy of the light or dark variant of a theme.
---@param opts neomodern.PaletteOpts
function M.get(opts)
    local palette
    if opts.variant == "light" then
        palette = require("neomodern.palette.day").get()
    else
        palette = vim.deepcopy(M[opts.theme])
    end

    if opts.flat ~= nil and opts.flat then
        return vim.tbl_deep_extend("force", palette.colormap, palette)
    end
    return palette
end

---@param opts neomodern.PaletteOpts
function M.set_term_colors(opts)
    local palette = M.get(opts)
    for i, c in ipairs(palette.colormap) do
        vim.g["terminal_color_" .. i - 1] = c
    end
end

return M
