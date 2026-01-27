local M = {}

---@alias neomodern.Background "default" | "alt" | "transparent"

---@alias neomodern.Theme "moon" | "iceclimber" | "gyokuro" | "hojicha" | "roseprime"

---@alias neomodern.GutterSpec { cursorline: boolean, dark: boolean }

---@alias neomodern.DiagnosticSpec { darker: boolean, undercurl: boolean, background: boolean }

---@alias neomodern.DefaultOverride table<string, string>

---@alias neomodern.HlSpec { guibg: string?, guifg: string?, guisp: string?, gui: string?, link: string? }

---@alias neomodern.HlGroupOverride table<string, neomodern.HlSpec>

---@alias neomodern.Overrides { default: neomodern.DefaultOverride, hlgroups:neomodern.HlGroupOverride }

---@class neomodern.Config
---@field background? neomodern.Background
---@field gutter? neomodern.GutterSpec
---@field diagnostics? neomodern.DiagnosticSpec
---@field overrides? neomodern.Overrides
---@field theme? neomodern.Theme
M.default = {
    background = "default", -- "alt", "transparent"

    gutter = {
        cursorline = false,
        dark = false,
    },

    diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
    },

    overrides = {
        default = {},
        hlgroups = {},
    },

    theme = "moon",
}

return M
