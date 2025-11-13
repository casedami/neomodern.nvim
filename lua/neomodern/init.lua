local Config = require("neomodern.config")
local M = {
    ---@type neomodern.Config
    _opts = {},
}

---Returns an owned copy of the config.
---@return neomodern.Config
function M.options()
    return vim.deepcopy(M._opts)
end

---Toggle between light/dark variants.
function M.toggle_variant()
    if vim.o.background == "light" then
        vim.o.background = "dark"
        vim.api.nvim_command("colorscheme " .. M._opts.theme)
    else
        vim.api.nvim_command("colorscheme neomodern-day")
    end
end

---Apply the colorscheme (same as `:colorscheme neomodern`).
---@param theme string?
function M.load(theme)
    M._opts.theme = theme or M._opts.theme
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end
    vim.o.termguicolors = true
    vim.g.colors_name = M._opts.theme
    M._opts.variant = vim.o.background
    require("neomodern.highlights").setup()
    if M._opts.term_colors then
        require("neomodern.palette").set_term_colors(M._opts.theme, M._opts.variant)
    end
end

---Set the config options.
---@param opts neomodern.Config
function M.setup(opts)
    ---@type neomodern.Config
    M._opts = vim.tbl_deep_extend("force", Config.default, opts or {})
    if M._opts.toggle_variant_key then
        vim.keymap.set(
            "n",
            M._opts.toggle_variant_key,
            '<cmd>lua require("neomodern").toggle_variant()<cr>',
            { noremap = true, silent = true }
        )
    end
end

return M
