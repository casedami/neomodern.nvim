local M = {}
local upstream = "https://github.com/cdmill/neomodern.nvim/raw/main/extras/"

---@alias neomodern.Extra {name: string, ext:string?, url:string, template: string}

---@param contents string
---@param fname string
local function write(contents, fname)
    vim.fn.mkdir(vim.fs.dirname("extras/" .. fname), "p")
    local file = io.open("extras/" .. fname, "w")
    if file then
        file:write(contents)
        file:close()
    end
end

---@param template string
---@param replace_dict table
---@return string
local function from_template(template, replace_dict)
    return (
        template:gsub("($%b{})", function(w)
            return vim.tbl_get(
                replace_dict,
                ---@diagnostic disable-next-line: deprecated
                unpack(vim.split(w:sub(3, -2), ".", { plain = true }))
            ) or w
        end)
    )
end

---@param s string
local function strip_prefix(s)
    return s:sub(2)
end

function M.generate()
    local Palette = require("neomodern.palette")
    local source = debug.getinfo(1).source:sub(2)
    local templates_dir = vim.fn.fnamemodify(source, ":p:h")
    local extras = vim.tbl_map(function(p)
        return vim.fn.fnamemodify(p, ":t:r")
    end, vim.fn.glob(string.format("%s/templates/*", templates_dir), false, true))

    for _, extra in ipairs(extras) do
        local e = require("neomodern.extras.templates." .. extra)

        for _, theme in pairs(Palette.themes) do
            ---@type neomodern.Palette
            local colors = Palette.get(theme)
            local replace_dict = vim.tbl_extend(
                "error",
                { url = e.url, upstream = upstream, theme = theme },
                vim.tbl_map(strip_prefix, colors.spec),
                vim.tbl_map(strip_prefix, colors.base16)
            )
            write(
                from_template(e.template, replace_dict),
                string.format(
                    "%s/%s%s",
                    e.name,
                    theme,
                    e.ext and string.format(".%s", e.ext) or ""
                )
            )
        end
    end
end

return M
