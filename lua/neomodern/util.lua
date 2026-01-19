local M = {}
local WHITE = "#FFFFFF"
local BLACK = "#000000"

---Translates color from HTML to RGB.
---@param color string hex color code
---@return table
local function hexToRgb(color)
    local hex = "[abcdef0-9][abcdef0-9]"
    local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
    color = string.lower(color)

    assert(
        string.find(color, pat) ~= nil,
        "hex_to_rgb: invalid hex_str: " .. tostring(color)
    )

    local r, g, b = string.match(color, pat)
    return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

---Util for blending colors. Alpha coefficeint should be between [0-1]
---where 0=b and 1=a.
---@param a string foreground color in hex
---@param b string background color in hex
---@param coeff number blend coefficient
---@return string
function M.blend(a, coeff, b)
    local A = hexToRgb(a)
    local B = hexToRgb(b)
    local alpha = math.abs(coeff)

    local blendChannel = function(i)
        local ret = ((1 - alpha) * B[i] + alpha * A[i])
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return string.format(
        "#%02X%02X%02X",
        blendChannel(1),
        blendChannel(2),
        blendChannel(3)
    )
end

function M.lighten(a, coeff)
    return M.blend(WHITE, coeff, a)
end

function M.darken(a, coeff)
    return M.blend(BLACK, coeff, a)
end

return M
