local M = {}

---@param palette neomodern.Theme
function M.get(palette)
    ---@type neomodern.Config
    local Config = require("neomodern").options()
    local Util = require("neomodern.util")
    local hl = {}

    local syntax = {
        Boolean = { fg = palette.number }, -- boolean constants
        Character = { fg = palette.string }, -- character constants
        Comment = { fg = palette.comment, fmt = Config.code_style.comments }, -- comments
        Constant = { fg = palette.constant, fmt = Config.code_style.constants }, -- (preferred) any constant
        Delimiter = { fg = palette.fg }, -- delimiter characters
        Float = { fg = palette.number }, -- float constants
        Function = { fg = palette.func, fmt = Config.code_style.functions }, -- functions
        Error = { fg = palette.diag_red }, -- (preferred) any erroneous construct
        Exception = { fg = palette.diag_red }, -- 'try', 'catch', 'throw'
        Identifier = { fg = palette.property, fmt = Config.code_style.variables }, -- (preferred) any variable
        Keyword = { fg = palette.keyword, fmt = Config.code_style.keywords }, -- any other keyword
        Conditional = { fg = palette.keyword, fmt = Config.code_style.conditionals }, -- conditionals
        -- Repeat = { fg = palette.keyword, fmt = config.code_style.keywords }, -- loop keywords: 'for', 'while' etc
        -- Label = { fg = palette.keyword }, -- 'case', 'default', etc
        Number = { fg = palette.number }, -- number constant
        Operator = { fg = palette.operator, fmt = Config.code_style.operators }, -- '+', '*', 'sizeof' etc
        PreProc = { fg = palette.string }, -- (preferred) generic preprocessor
        -- Define = { fg = palette.comment }, -- preprocessor '#define'
        Include = { fg = palette.constant, fmt = Config.code_style.keywords }, -- preprocessor '#include'
        Macro = { fg = palette.number, fmt = "italic" }, -- macros
        -- PreCondit = { fg = palette.comment }, -- preprocessor conditionals '#if', '#endif' etc
        Special = { fg = palette.type }, -- (preferred) any special symbol
        SpecialChar = { fg = palette.keyword }, -- special character in a constant
        -- SpecialComment = { fg = palette.keyword, fmt = config.code_style.comments }, -- special things inside comments
        -- Tag = { fg = palette.func }, -- can use <C-]> on this
        Statement = { fg = palette.keyword }, -- (preferred) any statement
        String = { fg = palette.string, fmt = Config.code_style.strings }, -- string constants
        Title = { fg = palette.keyword },
        Type = { fg = palette.type }, -- (preferred) 'int', 'long', 'char' etc
        -- StorageClass = { fg = palette.constant, fmt = config.code_style.keywords }, -- 'static', 'volatile' etc
        -- Structure = { fg = palette.constant }, -- 'struct', 'union', 'enum' etc
        -- Typedef = { fg = palette.constant }, -- 'typedef'
        Todo = { fg = Util.blend(palette.comment, 0.6, palette.fg), fmt = "bolditalic" }, -- (preferred) 'TODO' keywords in comments
    }

    local treesitter = vim.version()["minor"] > 0.8
            and {
                -- identifiers
                ["@variable"] = { fg = palette.fg, fmt = Config.code_style.variables }, -- any variable that does not have another higM.ght
                ["@variable.builtin"] = syntax["Type"], -- variable names that are defined by the language, like 'this' or 'self'
                ["@variable.member"] = { fg = palette.property }, -- fields
                ["@variable.parameter"] = { fg = palette.alt }, -- parameters of a function
                -- ["@variable.field"] = { fg = palette.property }, -- fields

                -- ["@constant"] = { link = "Constant" }, -- constants
                ["@constant.builtin"] = syntax["Type"], -- constants that are defined by the language, like 'nil' in lua
                -- ["@constant.macro"] = { link = "Macro" }, -- constants that are defined by macros like 'NULL' in c

                -- ["@label"] = { link = "Label" }, -- labels
                ["@module"] = syntax["Type"], -- modules and namespaces

                -- literals
                -- ["@string"] = { link = "String" }, -- strings
                ["@string.documentation"] = Config.colored_docstrings
                        and syntax["String"]
                    or syntax["Comment"], -- doc strings
                ["@string.regexp"] = syntax["SpecialChar"], -- regex
                ["@string.escape"] = syntax["SpecialChar"], -- escape characters within string
                ["@string.special.symbol"] = syntax["Identifier"],
                -- ["@string.special.url"] = { fg = palette.func }, -- urls, links, emails

                -- ["@character"] = { link = "String" }, -- character literals
                -- ["@character.special"] = M.syntax["SpecialChar"], -- special characters

                -- ["@boolean"] = { link = "Constant" }, -- booleans
                -- ["@number"] = { link = "Number" }, -- all numbers
                -- ["@number.float"] = { link = "Number" }, -- floats

                -- types
                ["@type"] = syntax["Type"], -- types
                -- ["@type.builtin"] = M.syntax["Type"], --builtin types
                -- ["@type.definition"] = M.syntax["Typedef"], -- typedefs
                -- ["@type.qualifier"]

                ["@attribute"] = syntax["Function"], -- attributes, like <decorators> in python
                -- ["@property"] = { fg = palette.property }, --same as TSField

                -- functions
                ["@function"] = syntax["Function"], -- functions
                ["@function.builtin"] = syntax["Function"], --builtin functions
                -- ["@function.macro"] = { link = "Macro" }, -- macro defined functions
                -- ["@function.call"]
                -- ["@function.method"]
                -- ["@function.method.call"]

                -- ["@constructor"] = { fg = palette.constant, fmt = config.code_style.functions }, -- constructor calls and definitions
                ["@constructor.lua"] = {
                    fg = palette.alt,
                    fmt = Config.code_style.functions,
                }, -- constructor calls and definitions, `= { }` in lua
                ["@operator"] = syntax["Operator"], -- operators, like `+`

                -- keywords
                ["@keyword"] = {
                    fg = palette.keyword,
                    fmt = Config.code_style.keywords,
                }, -- keywords that don't fall in previous categories
                ["@keyword.exception"] = syntax["Exception"], -- exception related keywords
                -- ["@keyword.import"] = M.syntax["PreProc"], -- keywords used to define a function
                ["@keyword.conditional"] = {
                    fg = palette.keyword,
                    fmt = Config.code_style.conditionals,
                }, -- keywords for conditional statements
                ["@keyword.operator"] = {
                    fg = palette.keyword,
                    fmt = Config.code_style.operators,
                }, -- keyword operator (eg, 'in' in python)
                ["@keyword.return"] = {
                    fg = palette.keyword,
                    fmt = Config.code_style.keyword_return,
                }, -- keywords used to define a function
                -- ["@keyword.function"] = M.syntax["Function"], -- keywords used to define a function
                -- ["@keyword.import"] = M.syntax["Include"], -- includes, like '#include' in c, 'require' in lua
                -- ["@keyword.storage"] = M.syntax["StorageClass"], -- visibility/life-time 'static'
                -- ["@keyword.repeat"] = M.syntax["Repeat"], -- for keywords related to loops

                -- punctuation
                ["@punctuation.delimiter"] = { fg = palette.fg }, -- delimiters, like `; . , `
                ["@punctuation.bracket"] = {
                    fg = palette.operator,
                }, -- brackets and parentheses
                ["@punctuation.special"] = syntax["SpecialChar"], -- punctuation that does not fall into above categories, like `{}` in string interpolation

                -- comment
                -- ["@comment"]
                ["@comment.error"] = {
                    fg = Util.blend(palette.comment, 0.4, palette.diag_red),
                    fmt = "bolditalic",
                },
                ["@comment.warning"] = {
                    fg = Util.blend(palette.comment, 0.4, palette.diag_yellow),
                    fmt = "bolditalic",
                },
                ["@comment.note"] = {
                    fg = Util.blend(palette.comment, 0.4, palette.diag_blue),
                    fmt = "bolditalic",
                },

                -- markup
                ["@markup"] = { fg = palette.fg }, -- text in markup language
                ["@markup.strong"] = { fg = palette.fg, fmt = "bold" }, -- bold
                ["@markup.italic"] = { fg = palette.fg, fmt = "italic" }, -- italic
                ["@markup.underline"] = { fg = palette.fg, fmt = "underline" }, -- underline
                ["@markup.strikethrough"] = {
                    fg = palette.comment,
                    fmt = "strikethrough",
                }, -- strikethrough
                ["@markup.heading"] = {
                    fg = palette.keyword,
                    fmt = Config.code_style.headings,
                }, -- markdown titles
                ["@markup.quote.markdown"] = { fg = palette.comment }, -- quotes with >
                ["@markup.link.uri"] = { fg = palette.alt, fmt = "underline" }, -- urls, links, emails
                ["@markup.link"] = { fg = palette.type }, -- text references, footnotes, citations, etc
                ["@markup.list"] = { fg = palette.func },
                ["@markup.list.checked"] = { fg = palette.func }, -- todo checked
                ["@markup.list.unchecked"] = { fg = palette.func }, -- todo unchecked
                ["@markup.raw"] = { fg = palette.func }, -- inline code in markdown
                ["@markup.math"] = { fg = palette.type }, -- math environments, like `$$` in latex

                -- diff
                ["@diff.plus"] = { fg = palette.diag_green }, -- added text (diff files)
                ["@diff.minus"] = { fg = palette.diag_red }, -- removed text (diff files)
                ["@diff.delta"] = { fg = palette.diag_blue }, -- changed text (diff files)

                -- tags
                -- ["@tag"]
                ["@tag.attribute"] = syntax["Identifier"], -- tags, like in html
                ["@tag.delimiter"] = { fg = palette.fg }, -- tag delimiter < >
            }
        or nil

    hl.lsp = vim.version()["minor"] > 0.9
            and {
                ["@lsp.typemod.variable.global"] = {
                    fg = Util.blend(palette.constant, 0.8, palette.bg),
                },
                ["@lsp.typemod.keyword.documentation"] = {
                    fg = Util.blend(palette.type, 0.8, palette.bg),
                },
                ["@lsp.type.namespace"] = {
                    fg = Util.blend(palette.constant, 0.8, palette.bg),
                },
                ["@lsp.type.macro"] = syntax["Macro"],
                ["@lsp.type.parameter"] = treesitter["@variable.parameter"],
                ["@lsp.type.lifetime"] = { fg = palette.type, fmt = "italic" },
                ["@lsp.type.readonly"] = { fg = palette.constant, fmt = "italic" },
                ["@lsp.mod.readonly"] = { fg = palette.constant, fmt = "italic" },
                ["@lsp.mod.typeHint"] = syntax["Type"],
            }
        or nil
    hl.diag = {
        DiagnosticError = { fg = palette.diag_red },
        DiagnosticHint = { fg = palette.diag_blue },
        DiagnosticInfo = { fg = palette.diag_blue, fmt = "italic" },
        DiagnosticWarn = { fg = palette.diag_yellow },

        DiagnosticVirtualTextError = {
            bg = Config.diagnostics.background
                    and Util.blend(palette.diag_red, 0.1, palette.bg)
                or nil,
            fg = palette.diag_red,
        },
        DiagnosticVirtualTextWarn = {
            bg = Config.diagnostics.background
                    and Util.blend(palette.diag_yellow, 0.1, palette.bg)
                or nil,
            fg = palette.diag_yellow,
        },
        DiagnosticVirtualTextInfo = {
            bg = Config.diagnostics.background
                    and Util.blend(palette.diag_blue, 0.1, palette.bg)
                or nil,
            fg = palette.diag_blue,
        },
        DiagnosticVirtualTextHint = {
            bg = Config.diagnostics.background
                    and Util.blend(palette.diag_blue, 0.1, palette.bg)
                or nil,
            fg = palette.diag_blue,
        },

        DiagnosticUnderlineError = {
            fmt = Config.diagnostics.undercurl and "undercurl" or "underline",
            sp = palette.diag_red,
        },
        DiagnosticUnderlineHint = {
            fmt = Config.diagnostics.undercurl and "undercurl" or "underline",
            sp = palette.diag_blue,
        },
        DiagnosticUnderlineInfo = {
            fmt = Config.diagnostics.undercurl and "undercurl" or "underline",
            sp = palette.diag_blue,
        },
        DiagnosticUnderlineWarn = {
            fmt = Config.diagnostics.undercurl and "undercurl" or "underline",
            sp = palette.diag_yellow,
        },

        LspReferenceText = { bg = palette.visual },
        LspReferenceWrite = { bg = palette.visual },
        LspReferenceRead = { bg = palette.visual },

        LspCodeLens = {
            fg = palette.keyword,
            bg = Util.blend(palette.keyword, 0.1, palette.bg),
            fmt = Config.code_style.comments,
        },
        LspCodeLensSeparator = { fg = palette.comment },
    }
    hl.LspDiagnosticsDefaultError = hl.DiagnosticError
    hl.LspDiagnosticsDefaultHint = hl.DiagnosticHint
    hl.LspDiagnosticsDefaultInformation = hl.DiagnosticInfo
    hl.LspDiagnosticsDefaultWarning = hl.DiagnosticWarn
    hl.LspDiagnosticsUnderlineError = hl.DiagnosticUnderlineError
    hl.LspDiagnosticsUnderlineHint = hl.DiagnosticUnderlineHint
    hl.LspDiagnosticsUnderlineInformation = hl.DiagnosticUnderlineInfo
    hl.LspDiagnosticsUnderlineWarning = hl.DiagnosticUnderlineWarn
    hl.LspDiagnosticsVirtualTextError = hl.DiagnosticVirtualTextError
    hl.LspDiagnosticsVirtualTextWarning = hl.DiagnosticVirtualTextWarn
    hl.LspDiagnosticsVirtualTextInformation = hl.DiagnosticVirtualTextInfo
    hl.LspDiagnosticsVirtualTextHint = hl.DiagnosticVirtualTextHint
    hl.syntax = syntax
    hl.treesitter = treesitter

    return hl
end

return M
