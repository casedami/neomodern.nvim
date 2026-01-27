local M = {}

M.get = function(palette, _, _)
    return {
        BlinkCmpKind = { guifg = palette.comment },
    }
end

return M
