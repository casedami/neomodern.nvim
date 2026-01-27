local M = {}

M.get = function(palette, _, _)
    return {
        CmpItemAbbr = { guifg = palette.fg },
        CmpItemAbbrDeprecated = { guifg = palette.comment, gui = "strikethrough" },
        CmpItemAbbrMatch = { guifg = palette.type },
        CmpItemAbbrMatchFuzzy = { guifg = palette.type, gui = "underline" },
        CmpItemMenu = { guifg = palette.comment },
        CmpItemKind = { guifg = palette.comment },
    }
end

return M
