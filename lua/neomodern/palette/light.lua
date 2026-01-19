local M = {}

---Generates a light mode variant for a provided theme by inverting colors.
---@param colors neomodern.PrePalette
---@return neomodern.PrePalette
local function generate_light_variant(colors)
    local hsluv = require("neomodern.hsluv")
    local saturation_coeff = 25e-2
    local brightness_coeff = 1e-4
    local function invert(cname, cval)
        if type(cval) == "table" then
            for k, v in pairs(cval) do
                cval[k] = invert(k, v)
            end
            return cval
        elseif type(cval) == "string" and cval ~= "none" then
            local hsl = hsluv.hex_to_hsluv(cval)

            if cname:find("bg$") and hsl[3] < 50 then
                hsl[3] = 98 - hsl[3]
                hsl[3] = hsl[3] + (98 - hsl[3]) * brightness_coeff
            else
                -- increase saturation
                hsl[2] = hsl[2] + (100 - hsl[2]) * saturation_coeff
                hsl[3] = 100 - hsl[3]
                if hsl[3] < 50 then
                    -- increase brightness
                    hsl[3] = hsl[3] + (100 - hsl[3]) * brightness_coeff
                end
            end
            return hsluv.hsluv_to_hex(hsl)
        end
    end

    for k, v in pairs(colors) do
        colors[k] = invert(k, v)
    end
    return colors
end

M.get = function(theme)
    theme = theme or vim.g.colors_name
    ---@type neomodern.PrePalette
    local c = require(string.format("neomodern.palette.%s", theme))
    return generate_light_variant(vim.deepcopy(c))
end

return M
