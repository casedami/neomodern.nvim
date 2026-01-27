---@about Neomodern.nvim
---A collection of modern, simple, unintrusive themes.

local M = {}
local Config = require("neomodern.config")

---@type neomodern.Config
local opts = Config.default

---@param theme string?
local function resolve_theme(theme)
    theme = theme or opts.theme
    if require("neomodern.palette").themes[theme] == nil then
        vim.schedule(function()
            vim.notify(
                string.format("Neomodern: unknown theme '%s'", theme),
                vim.log.levels.WARN,
                {}
            )
        end)
        theme = Config.default.theme
    end
    return theme
end

---Applies the colorscheme (same as `:colorscheme ...`).
---
---If `@param theme` is not provided, then uses the value specified in the
---config table. If overriding the default theme, make sure to call
---`neomodern.setup(...)` first.
---
---Note: enforces `vim.opt.termguicolors=true`.
---@param theme string?
function M.load(theme)
    opts.theme = resolve_theme(theme)
    vim.cmd("hi clear")
    vim.g.colors_name = opts.theme
    vim.o.termguicolors = true
    require("neomodern.highlights").apply(opts)
end

---Overrides the default configuration. Should be called before
---`neomodern.load(...)`.
---@param cfg neomodern.Config
function M.setup(cfg)
    opts = vim.tbl_deep_extend("force", opts, cfg or {})
end

return M
