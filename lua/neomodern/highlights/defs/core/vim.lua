local M = {}
local Util = require("neomodern.util")

M.get = function(palette, base16, opts)
    local darkgutter = Util.darken(palette.bg, 0.15)

    return {
        ColorColumn = { guibg = palette.line },
        Conceal = {
            guifg = palette.func,
            guibg = palette.bg,
        },
        CurSearch = { guifg = palette.type, guibg = palette.visual },
        Cursor = { gui = "reverse" },
        vCursor = { gui = "reverse" },
        iCursor = { gui = "reverse" },
        lCursor = { gui = "reverse" },
        CursorIM = { gui = "reverse" },
        CursorColumn = { guibg = palette.line },
        CursorLine = { guibg = palette.line },
        CursorLineNr = {
            guifg = palette.fg,
            guibg = (
                (opts.gutter.cursorline and palette.line or nil)
                or (opts.gutter.dark and darkgutter or "none")
            ) or palette.bg,
        },
        CursorLineSign = { guibg = opts.gutter.cursorline and palette.line or "none" },
        CursorLineFold = {
            guifg = palette.fg,
            guibg = opts.gutter.cursorline and palette.line or "none",
        },
        Debug = { guifg = palette.operator },
        debugPC = { guifg = palette.diag_red },
        debugBreakpoint = { guifg = palette.diag_red },
        DiffAdd = { guibg = Util.blend(palette.diag_green, 0.3, palette.bg) },
        DiffChange = { guibg = Util.blend(palette.diag_blue, 0.2, palette.bg) },
        DiffDelete = { guibg = Util.blend(palette.diag_red, 0.4, palette.bg) },
        DiffText = {
            guibg = Util.blend(palette.diag_blue, 0.1, palette.bg),
            guifg = palette.diag_blue,
        },
        Directory = { guifg = base16.blue },
        ErrorMsg = { guifg = palette.diag_red, gui = "bold" },
        EndOfBuffer = { guifg = palette.comment },
        FloatBorder = {
            guifg = palette.operator,
            guibg = palette.bg,
        },
        FloatTitle = {
            guifg = palette.comment,
            guibg = palette.line,
        },
        Folded = {
            guifg = palette.comment,
            guibg = palette.line,
        },
        FoldColumn = {
            guifg = palette.comment,
            guibg = (opts.gutter.dark and darkgutter or nil) or palette.bg,
        },
        IncSearch = { guifg = palette.type, guibg = palette.visual },
        LineNr = {
            guifg = palette.comment,
            guibg = (opts.gutter.dark and darkgutter or nil) or palette.bg,
        },
        MatchParen = { guifg = palette.fg, guibg = palette.visual, gui = "bold" },
        ModeMsg = { guifg = palette.fg, gui = "bold" },
        MoreMsg = { guifg = palette.func, gui = "bold" },
        MsgSeparator = { guifg = palette.string, guibg = palette.line, gui = "bold" },
        NonText = { guifg = palette.comment },
        Normal = { guifg = palette.fg, guibg = palette.bg },
        NormalFloat = {
            guifg = palette.fg,
            guibg = opts.bg == "transparent" and "none" or palette.line,
        },
        Pmenu = {
            guifg = palette.comment,
            guibg = palette.bg,
            gui = "none",
        },
        PmenuSbar = { guibg = palette.line },
        PmenuSel = {
            guifg = palette.alt,
            guibg = opts.bg == "transparent" and "none" or palette.line,
            gui = "none",
        },
        PmenuThumb = { guibg = palette.visual },
        Question = { guifg = palette.constant },
        QuickFixLine = { guifg = palette.func, gui = "underline" },
        Search = { guifg = palette.alt, guibg = palette.visual },
        SignColumn = {
            guifg = palette.fg,
            guibg = opts.gutter.dark and darkgutter or palette.bg,
        },
        SpecialKey = { guifg = palette.comment },
        SpellBad = { guifg = "none", gui = "undercurl", guisp = palette.diag_red },
        SpellCap = { guifg = "none", gui = "undercurl", guisp = palette.diag_yellow },
        SpellLocal = { guifg = "none", gui = "undercurl", guisp = palette.diag_blue },
        SpellRare = { guifg = "none", gui = "undercurl", guisp = palette.diag_blue },
        StatusLine = { guifg = palette.comment, guibg = palette.line },
        StatusLineTerm = { guifg = palette.comment, guibg = palette.line },
        StatusLineNC = { guifg = palette.comment, guibg = palette.line },
        StatusLineTermNC = { guifg = palette.comment, guibg = palette.line },
        Substitute = { guifg = palette.type, guibg = palette.visual },
        TabLine = { guifg = palette.comment, guibg = palette.line },
        TabLineFill = { guifg = palette.comment, guibg = palette.line },
        TabLineSel = { guifg = palette.alt, guibg = palette.visual },
        Terminal = { guifg = palette.fg, guibg = palette.bg },
        ToolbarButton = { guifg = palette.bg, guibg = palette.visual },
        ToolbarLine = { guifg = palette.fg },
        Visual = { guifg = palette.alt, guibg = palette.visual },
        VisualNOS = { guifg = "none", guibg = palette.comment, gui = "underline" },
        WarningMsg = { guifg = palette.diag_yellow, gui = "bold" },
        Whitespace = { guifg = palette.comment },
        WildMenu = {
            guifg = palette.alt,
            guibg = Util.blend(palette.diag_blue, 0.1, palette.bg),
        },
        WinSeparator = { guifg = palette.operator },

        healthSectionDelim = { guifg = palette.keyword, guibg = palette.line },
    }
end

return M
