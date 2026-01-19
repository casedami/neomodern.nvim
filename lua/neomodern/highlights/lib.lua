---@class Highlight
---@field guifg  string?
---@field guibg  string?
---@field guisp  string?
---@field gui  string?
---@field link  string?

local M = {}
local HL_ARGS = { guifg = true, guibg = true, guisp = true, gui = false, link = false }

local function resolve_override(field, is_hex, new, palette)
    if new == nil then
        return nil
    elseif type(new) ~= "string" then
        vim.schedule(function()
            vim.notify(
                string.format("Neomodern: unknown value format for field '%s'", field),
                vim.log.levels.WARN
            )
        end)
        return nil
    end

    -- For 'gui' | 'link', assume value is correct. See `:h highlight-args`.
    if not is_hex then
        return new
    end

    -- Accept hex code literals
    if new:sub(1, 1) == "#" then
        return new
    end

    -- Resolve default neomodern.Palette.Spec references
    if new:sub(1, 1) == "$" then
        local color_name = new:sub(2)
        local hex = palette[color_name]
        if hex then
            return hex
        end
    end

    vim.schedule(function()
        vim.notify(
            string.format(
                "Neomodern: unknown color or color format -- '%s=%s'",
                field,
                new
            ),
            vim.log.levels.WARN
        )
    end)
    return nil
end

---@param default Highlight
---@param new Highlight
---@param palette neomodern.Palette.Spec
---@return Highlight
M.overwrite = function(default, new, palette)
    local result = {}
    for field, is_hex in pairs(HL_ARGS) do
        result[field] = resolve_override(field, is_hex, new[field], palette)
            or default[field]
    end
    return result
end

---@param group string
---@param hl Highlight
M.to_str = function(group, hl)
    if hl.link ~= nil then
        return string.format("highlight link %s %s", group, hl.link)
    end

    local parts = vim.iter(HL_ARGS)
        :filter(function(field)
            return field ~= "link" and hl[field] ~= nil
        end)
        :map(function(field)
            return string.format("%s=%s", field, hl[field])
        end)
        :totable()

    return string.format("highlight %s %s", group, table.concat(parts, " "))
end

return M
