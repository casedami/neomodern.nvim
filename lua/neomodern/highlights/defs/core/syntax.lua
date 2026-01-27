local M = {}
local Util = require("neomodern.util")

M.get = function(palette, _, _)
    return {
        Boolean = { guifg = palette.number },
        Character = { guifg = palette.string },
        Comment = { guifg = palette.comment },
        Constant = { guifg = palette.constant },
        Delimiter = { guifg = palette.fg },
        Float = { guifg = palette.number },
        Function = { guifg = palette.func },
        Error = { guifg = palette.diag_red },
        Exception = { guifg = palette.diag_red },
        Identifier = { guifg = palette.property },
        Keyword = { guifg = palette.keyword },
        Conditional = { guifg = palette.keyword },
        -- Repeat = { guifg = palette.keyword },
        -- Label = { guifg = palette.keyword },
        Number = { guifg = palette.number },
        Operator = { guifg = palette.operator },
        PreProc = { guifg = palette.string },
        -- Define = { guifg = palette.comment },
        Include = { guifg = palette.constant },
        Macro = { guifg = palette.number, gui = "italic" },
        -- PreCondit = { guifg = palette.comment },
        Special = { guifg = palette.type },
        SpecialChar = { guifg = palette.keyword },
        -- SpecialComment = { guifg = palette.keyword },
        -- Tag = { guifg = palette.func },
        Statement = { guifg = palette.keyword, gui = "none" },
        String = { guifg = palette.string },
        Title = { guifg = palette.keyword },
        Type = { guifg = palette.type },
        -- StorageClass = { guifg = palette.constant },
        -- Structure = { guifg = palette.constant },
        -- Typedef = { guifg = palette.constant },
        Todo = {
            guifg = Util.blend(palette.comment, 0.6, palette.fg),
            gui = "bolditalic",
        },
    }
end

return M
