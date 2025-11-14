local M = {}

---@type palette neomodern.Theme
function M.get(palette)
    ---@type neomodern.Config
    local Config = require("neomodern").options()
    local Util = require("neomodern.util")
    local hl = {}

    hl.special = {
        LazyNormal = { bg = palette.line },
        MasonNormal = { bg = palette.line },
    }

    hl.cmp = {
        CmpItemAbbr = { fg = palette.fg },
        CmpItemAbbrDeprecated = { fg = palette.comment, fmt = "strikethrough" },
        CmpItemAbbrMatch = { fg = palette.type },
        CmpItemAbbrMatchFuzzy = { fg = palette.type, fmt = "underline" },
        CmpItemMenu = { fg = palette.comment },
        CmpItemKind = {
            fg = palette.comment,
            fmt = Config.plugin.cmp.reverse and "reverse",
        },
    }

    hl.blink = {
        BlinkCmpKind = {
            fg = palette.comment,
            fmt = Config.plugin.cmp.reverse and "reverse",
        },
    }

    hl.diffview = {
        DiffviewFilePanelTitle = { fg = palette.func, fmt = "bold" },
        DiffviewFilePanelCounter = { fg = palette.alt, fmt = "bold" },
        DiffviewFilePanelFileName = { fg = palette.fg },
        DiffviewNormal = { link = "Normal" },
        DiffviewCursorLine = { link = "CursorLine" },
        DiffviewVertSplit = { link = "VertSplit" },
        DiffviewSignColumn = { link = "SignColumn" },
        DiffviewStatusLine = { link = "StatusLine" },
        DiffviewStatusLineNC = { link = "StatusLineNC" },
        DiffviewEndOfBuffer = { link = "EndOfBuffer" },
        DiffviewFilePanelRootPath = { fg = palette.comment },
        DiffviewFilePanelPath = { fg = palette.comment },
        DiffviewFilePanelInsertions = { fg = palette.fg },
        DiffviewFilePanelDeletions = { fg = palette.operator },
        DiffviewStatusAdded = { fg = palette.fg },
        DiffviewStatusUntracked = { fg = palette.diag_blue },
        DiffviewStatusModified = { fg = palette.diag_blue },
        DiffviewStatusRenamed = { fg = palette.diag_blue },
        DiffviewStatusCopied = { fg = palette.diag_blue },
        DiffviewStatusTypeChange = { fg = palette.diag_blue },
        DiffviewStatusUnmerged = { fg = palette.diag_blue },
        DiffviewStatusUnknown = { fg = palette.diag_red },
        DiffviewStatusDeleted = { fg = palette.diag_red },
        DiffviewStatusBroken = { fg = palette.diag_red },
    }

    hl.gitsigns = {
        GitSignsAdd = { fg = palette.diag_green },
        GitSignsAddLn = { fg = palette.diag_green },
        GitSignsAddNr = { fg = palette.diag_green },
        GitSignsAddCul = { fg = palette.diag_green, bg = palette.line },
        GitSignsChange = { fg = palette.diag_blue },
        GitSignsChangeLn = { fg = palette.diag_blue },
        GitSignsChangeNr = { fg = palette.diag_blue },
        GitSignsChangeCul = { fg = palette.diag_blue, bg = palette.line },
        GitSignsDelete = { fg = palette.diag_red },
        GitSignsDeleteLn = { fg = palette.diag_red },
        GitSignsDeleteNr = { fg = palette.diag_red },
        GitSignsDeleteCul = { fg = palette.diag_red, bg = palette.line },
    }

    hl.neogit = {
        NeogitBranch = { fg = palette.alt },
        NeogitUntrackedfiles = { fg = palette.diag_blue, fmt = "italic" },
        NeogitUnpulledchanges = { fg = palette.diag_blue, fmt = "italic" },
        NeogitUnmergedchanges = { fg = palette.keyword, fmt = "bolditalic" },
        NeogitDiffAdd = { link = "DiffAdd" },
        NeogitDiffAddHighlight = { link = "DiffAdd" },
        NeogitDiffAddCursor = { bg = Util.blend(palette.diag_green, 0.2, palette.bg) },
        NeogitDiffDelete = { link = "DiffDelete" },
        NeogitDiffDeleteHighlight = { link = "DiffDelete" },
        NeogitDiffDeleteCursor = {
            bg = Util.blend(palette.diag_red, 0.2, palette.bg),
        },
        NeogitDiffContext = { bg = palette.line },
        NeogitDiffContextHighlight = { bg = palette.line },
        NeogitDiffContextCursor = { bg = palette.line },
        NeogitSectionHeader = { fg = palette.func },
        NeogitHunkHeader = { fg = palette.comment },
        NeogitHunkHeaderHighlight = { fg = palette.comment, fmt = "italic" },
        NeogitHunkHeaderCursor = { fg = palette.comment, fmt = "bolditalic" },
        NeogitHunkMergeHeader = {
            fg = palette.diag_blue,
            bg = palette.line,
            fmt = "bold",
        },
        NeogitHunkMergeHeaderHighlight = {
            fg = palette.diag_blue,
            bg = palette.line,
            fmt = "italic",
        },
        NeogitHunkMergeHeaderCursor = {
            fg = palette.diag_blue,
            bg = palette.line,
            fmt = "bolditalic",
        },
    }

    hl.neo_tree = {
        NeoTreeNormal = {
            fg = palette.fg,
            bg = Config.transparent and nil or palette.bg,
        },
        NeoTreeNormalNC = {
            fg = palette.fg,
            bg = Config.transparent and nil or palette.bg,
        },
        NeoTreeVertSplit = {
            fg = palette.comment,
            bg = Config.transparent and nil or palette.comment,
        },
        NeoTreeWinSeparator = {
            fg = palette.comment,
            bg = Config.transparent and nil or palette.comment,
        },
        NeoTreeEndOfBuffer = {
            fg = Config.show_eob and palette.comment or palette.bg,
            bg = Config.transparent and nil or palette.bg,
        },
        NeoTreeRootName = { fg = palette.type, fmt = "bold" },
        NeoTreeGitAdded = { fg = palette.fg },
        NeoTreeGitDeleted = { fg = palette.diag_red },
        NeoTreeGitModified = { fg = palette.diag_blue },
        NeoTreeGitConflict = { fg = palette.diag_red, fmt = "bold,italic" },
        NeoTreeGitUntracked = { fg = palette.diag_red, fmt = "italic" },
        NeoTreeIndentMarker = { fg = palette.comment },
        NeoTreeSymbolicLinkTarget = { fg = palette.diag_blue },
    }

    hl.nvim_tree = {
        NvimTreeNormal = {
            fg = palette.fg,
            bg = Config.transparent and nil or palette.bg,
        },
        NvimTreeVertSplit = {
            fg = palette.line,
            bg = Config.transparent and nil or palette.bg,
        },
        NvimTreeEndOfBuffer = {
            fg = Config.show_eob and palette.comment or palette.bg,
            bg = Config.transparent and nil or palette.bg,
        },
        NvimTreeRootFolder = { fg = palette.type, fmt = "bold" },
        NvimTreeGitDirty = { fg = palette.diag_blue },
        NvimTreeGitNew = { fg = palette.fg },
        NvimTreeGitDeleted = { fg = palette.diag_red },
        NvimTreeSpecialFile = { fg = palette.diag_yellow, fmt = "underline" },
        NvimTreeIndentMarker = { fg = palette.fg },
        NvimTreeImageFile = { fg = palette.visual },
        NvimTreeSymlink = { fg = palette.diag_blue },
        NvimTreeFolderName = { fg = palette.func },
    }

    hl.obsidian = {
        ObsidianTodo = { link = "@markup.list.unchecked" },
        ObsidianDone = { link = "@markup.list.checked" },
        ObsidianRightArrow = { bold = true, fg = palette.fg },
        ObsidianTilde = { bold = true, fg = palette.fg },
        ObsidianBullet = { link = "@markup.list" },
        ObsidianRefText = { link = "@markup.link" },
        ObsidianExtLinkIcon = { link = "@markup.strikethrough" },
        ObsidianTag = { link = "@markup.list.unchecked" },
        ObsidianHighlightText = {
            bg = Util.blend(palette.constant, 0.1, palette.bg),
            fg = palette.constant,
        },
    }

    hl.snacks = {
        SnacksDashboardIcon = { fg = palette.func },
        SnacksDashboardDesc = { fg = palette.func },
        SnacksDashboardFile = { fg = palette.alt },
        SnacksDashboardSpecial = { fg = palette.type },
    }

    hl.telescope = {
        TelescopeTitle = { fg = palette.comment },
        TelescopeBorder = { fg = palette.comment },
        TelescopeMatching = { fg = palette.type, fmt = "bold" },
        TelescopePromptPrefix = { fg = palette.type },
        TelescopeSelection = {
            fg = palette.diag_blue,
            bg = Config.transparent and nil or palette.line,
        },
        TelescopeSelectionCaret = { fg = palette.diag_blue },
        TelescopeResultsNormal = { fg = palette.fg },
    }

    hl.dashboard = {
        DashboardShortCut = { fg = palette.func },
        DashboardHeader = { fg = palette.keyword },
        DashboardCenter = { fg = palette.fg },
        DashboardFooter = { fg = palette.func, fmt = "italic" },
    }

    hl.ministarter = {
        MiniStarterHeader = { fg = palette.keyword },
        MiniStarterFooter = { fg = palette.keyword },
    }

    hl.indent_blankline = {
        IndentBlanklineIndent1 = { fg = palette.func },
        IndentBlanklineIndent2 = { fg = palette.fg },
        IndentBlanklineIndent3 = { fg = palette.keyword },
        IndentBlanklineIndent4 = { fg = palette.comment },
        IndentBlanklineIndent5 = { fg = palette.alt },
        IndentBlanklineIndent6 = { fg = palette.operator },
        IndentBlanklineChar = { fg = palette.comment, fmt = "nocombine" },
        IndentBlanklineContextChar = { fg = palette.comment, fmt = "nocombine" },
        IndentBlanklineContextStart = { sp = palette.comment, fmt = "underline" },
        IndentBlanklineContextSpaceChar = { fmt = "nocombine" },
        IblIndent = { fg = palette.comment, fmt = "nocombine" },
        IblWhitespace = { fg = palette.comment, fmt = "nocombine" },
        IblScope = { fg = palette.comment, fmt = "nocombine" },
    }

    if not Config.plugin.cmp.plain then
        local lsp_kind_icons_color = {
            Default = palette.keyword,
            Array = palette.keyword,
            Boolean = palette.func,
            Class = palette.type,
            Color = palette.fg,
            Constant = palette.constant,
            Constructor = palette.constant,
            Enum = palette.constant,
            EnumMember = palette.property,
            Event = palette.type,
            Field = palette.property,
            File = palette.fg,
            Folder = palette.func,
            Function = palette.func,
            Interface = palette.constant,
            Key = palette.keyword,
            Keyword = palette.keyword,
            Method = palette.func,
            Module = palette.constant,
            Namespace = palette.constant,
            Null = palette.type,
            Number = palette.func,
            Object = palette.type,
            Operator = palette.operator,
            Package = palette.constant,
            Property = palette.property,
            Reference = palette.type,
            Snippet = palette.type,
            String = palette.string,
            Struct = palette.keyword,
            Text = palette.fg,
            TypeParameter = palette.type,
            Unit = palette.fg,
            Value = palette.fg,
            Variable = palette.fg,
        }

        for kind, color in pairs(lsp_kind_icons_color) do
            hl.cmp["CmpItemKind" .. kind] =
                { fg = color, fmt = Config.plugin.cmp.reverse and "reverse" }
            hl.cmp["BlinkCmpKind" .. kind] =
                { fg = color, fmt = Config.plugin.cmp.reverse and "reverse" }
        end
    end
    return hl
end

return M
