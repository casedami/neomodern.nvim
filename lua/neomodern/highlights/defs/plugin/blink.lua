local M = {}

M.get = function(palette, _)
    return {
        BlinkCmpKind = { guifg = palette.comment },
    }
end

return M
