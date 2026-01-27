local M = {}
local lib = require("neomodern.highlights.lib")

---Searches all subdirectories of
---<neomodern_dir>/lua/neomodern/highlights/defs/ for lua files and
---concatanates the results to return a single list of highlight definitions.
---@param palette neomodern.Palette
---@param opts neomodern.Config
---@return table<string, Highlight>
local function load_defs(palette, opts)
    local source = debug.getinfo(1).source:sub(2)
    local hl_dir = vim.fn.fnamemodify(source, ":p:h")
    local subdirs = vim.fn.glob(string.format("%s/defs/*", hl_dir), false, true)
    local result = {}

    for _, subdir in ipairs(subdirs) do
        for _, fpath in
            ipairs(vim.fn.glob(string.format("%s/*.lua", subdir), false, true))
        do
            result = vim.tbl_extend(
                "error",
                result,
                require(
                    string.format(
                        "neomodern.highlights.defs.%s.%s",
                        vim.fn.fnamemodify(subdir, ":t"),
                        vim.fn.fnamemodify(fpath, ":t:r")
                    )
                ).get(palette.spec, palette.base16, opts)
            )
        end
    end

    return result
end

---@param opts neomodern.Config
function M.apply(opts)
    ---@type neomodern.Palette
    local palette = require("neomodern.palette").get(
        opts.theme,
        opts.background,
        opts.overrides.default
    )
    local neomodern = load_defs(palette, opts)
    for group, hl in pairs(neomodern) do
        if opts.overrides.hlgroups[group] ~= nil then
            hl = lib.overwrite(hl, opts.overrides.hlgroups[group], palette.spec)
        end
        vim.api.nvim_command(lib.to_str(group, hl))
    end
end

return M
