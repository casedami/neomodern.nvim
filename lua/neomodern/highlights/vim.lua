local M = {}
local Util = require("neomodern.util")

---@param palette neomodern.Theme
function M.get(palette)
    ---@type neomodern.Config
    local Config = require("neomodern").options()
    local hl = {}

    local darkgutter
    if Config.alt_bg then
        palette.bg = palette.alt_bg
        darkgutter = Util.blend(palette.bg, 0.85, "#000000")
    else
        darkgutter = palette.alt_bg
    end

    hl.ColorColumn = { bg = palette.line }
    hl.Conceal = { fg = palette.func, bg = Config.transparent and "none" or palette.bg }
    hl.CurSearch = { fg = palette.type, bg = palette.visual }
    hl.Cursor = { fmt = "reverse" }
    hl.vCursor = { fmt = "reverse" }
    hl.iCursor = { fmt = "reverse" }
    hl.lCursor = { fmt = "reverse" }
    hl.CursorIM = { fmt = "reverse" }
    hl.CursorColumn = { bg = palette.line }
    hl.CursorLine = { bg = palette.line }
    hl.CursorLineNr = {
        fg = palette.fg,
        bg = (
            (Config.cursorline_gutter and palette.line or nil)
            or (Config.dark_gutter and darkgutter or "none")
        ) or palette.bg,
    }
    hl.CursorLineSign = { bg = Config.cursorline_gutter and palette.line or "none" }
    hl.CursorLineFold = {
        fg = palette.fg,
        bg = Config.cursorline_gutter and palette.line or "none",
    }
    hl.Debug = { fg = palette.operator }
    hl.debugPC = { fg = palette.diag_red }
    hl.debugBreakpoint = { fg = palette.diag_red }
    hl.DiffAdd = { bg = Util.blend(palette.diag_green, 0.3, palette.bg) }
    hl.DiffChange = { bg = Util.blend(palette.diag_blue, 0.2, palette.bg) }
    hl.DiffDelete = { bg = Util.blend(palette.diag_red, 0.4, palette.bg) }
    hl.DiffText = { fg = palette.fg }
    hl.Directory = { fg = palette.string }
    hl.ErrorMsg = { fg = palette.diag_red, fmt = "bold" }
    hl.EndOfBuffer = { fg = Config.show_eob and palette.comment or palette.bg }
    hl.FloatBorder =
        { fg = palette.comment, bg = Config.plain_float and "none" or palette.bg }
    hl.FloatTitle =
        { fg = palette.comment, bg = Config.plain_float and "none" or palette.line }
    hl.Folded =
        { fg = palette.comment, bg = Config.transparent and "none" or palette.line }
    hl.FoldColumn = {
        fg = palette.comment,
        bg = (
            (Config.transparent and "none" or nil)
            or (Config.dark_gutter and darkgutter or nil)
        ) or palette.bg,
    }
    hl.IncSearch = { fg = palette.type, bg = palette.visual }
    hl.LineNr = {
        fg = palette.comment,
        bg = (
            (Config.transparent and "none" or nil)
            or (Config.dark_gutter and darkgutter or nil)
        ) or palette.bg,
    }
    hl.MatchParen = { fg = palette.fg, bg = palette.visual, fmt = "bold" }
    hl.ModeMsg = { fg = palette.fg, fmt = "bold" }
    hl.MoreMsg = { fg = palette.func, fmt = "bold" }
    hl.MsgSeparator = { fg = palette.string, bg = palette.line, fmt = "bold" }
    hl.NonText = { fg = palette.comment }
    hl.Normal = { fg = palette.fg, bg = Config.transparent and "none" or palette.bg }
    hl.NormalFloat = {
        fg = palette.fg,
        bg = (Config.transparent or Config.plain_float) and "none" or palette.line,
    }
    hl.Pmenu = { fg = palette.fg, bg = Config.plain_float and "none" or palette.visual }
    hl.PmenuSbar = { bg = palette.line }
    hl.PmenuSel =
        { fg = palette.diag_blue, bg = Config.transparent and "none" or palette.line }
    hl.PmenuThumb = { bg = palette.visual }
    hl.Question = { fg = palette.constant }
    hl.QuickFixLine = { fg = palette.func, fmt = "underline" }
    hl.Search = { fg = palette.diag_blue, bg = palette.visual }
    hl.SignColumn = {
        fg = palette.fg,
        bg = (
            (Config.transparent and "none" or nil)
            or (Config.dark_gutter and darkgutter)
        ) or palette.bg,
    }
    hl.SpecialKey = { fg = palette.comment }
    hl.SpellBad = { fg = "none", fmt = "undercurl", sp = palette.diag_red }
    hl.SpellCap = { fg = "none", fmt = "undercurl", sp = palette.diag_yellow }
    hl.SpellLocal = { fg = "none", fmt = "undercurl", sp = palette.diag_blue }
    hl.SpellRare = { fg = "none", fmt = "undercurl", sp = palette.diag_blue }
    hl.StatusLine = { fg = palette.comment, bg = palette.line }
    hl.StatusLineTerm = { fg = palette.comment, bg = palette.line }
    hl.StatusLineNC = { fg = palette.comment, bg = palette.line }
    hl.StatusLineTermNC = { fg = palette.comment, bg = palette.line }
    hl.Substitute = { fg = palette.type, bg = palette.visual }
    hl.TabLine = { fg = palette.comment, bg = palette.line }
    hl.TabLineFill = { fg = palette.comment, bg = palette.line }
    hl.TabLineSel = { fg = palette.diag_blue, bg = palette.visual }
    hl.Terminal = { fg = palette.fg, bg = Config.transparent and "none" or palette.bg }
    hl.ToolbarButton = { fg = palette.bg, bg = palette.visual }
    hl.ToolbarLine = { fg = palette.fg }
    hl.Visual = { fg = palette.alt, bg = palette.visual }
    hl.VisualNOS = { fg = "none", bg = palette.comment, fmt = "underline" }
    hl.WarningMsg = { fg = palette.diag_yellow, fmt = "bold" }
    hl.Whitespace = { fg = palette.comment }
    hl.WildMenu =
        { fg = palette.diag_blue, bg = Util.blend(palette.diag_blue, 0.1, palette.bg) }
    hl.WinSeparator = { fg = palette.comment }
    return hl
end

return M
