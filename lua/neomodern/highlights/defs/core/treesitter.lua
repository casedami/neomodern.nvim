local M = {}
local Util = require("neomodern.util")

M.get = function(palette, _, _)
    return {
        -- identifiers
        ["@variable"] = { guifg = palette.fg }, -- any variable that does not have another highlight
        ["@variable.builtin"] = { link = "Type" }, -- variable names that are defined by the language, like 'this' or 'self'
        ["@variable.member"] = { guifg = palette.property }, -- fields
        ["@variable.parameter"] = { guifg = palette.alt }, -- parameters of a function
        -- ["@variable.field"] = { guifg =palette.property }, -- fields

        -- ["@constant"] = { link = "Constant" }, -- constants
        ["@constant.builtin"] = { link = "Type" }, -- constants that are defined by the language, like 'nil' in lua
        -- ["@constant.macro"] = { link = "Macro" }, -- constants that are defined by macros like 'NULL' in c

        -- ["@label"] = { link = "Label" }, -- labels
        ["@module"] = { link = "Type" }, -- modules and namespaces

        -- literals
        -- ["@string"] = { link = "String" }, -- strings
        ["@string.documentation"] = { link = "String" },
        ["@string.regexp"] = { link = "SpecialChar" }, -- regex
        ["@string.escape"] = { link = "SpecialChar" }, -- escape characters within string
        ["@string.special.symbol"] = { link = "Identifier" },
        -- ["@string.special.url"] = { guifg =palette.func }, -- urls, links, emails

        -- ["@character"] = { link = "String" }, -- character literals
        -- ["@character.special"] = M.{ link = "SpecialChar" },, -- special characters

        -- ["@boolean"] = { link = "Constant" }, -- booleans
        -- ["@number"] = { link = "Number" }, -- all numbers
        -- ["@number.float"] = { link = "Number" }, -- floats

        -- types
        ["@type"] = { link = "Type" }, -- types
        -- ["@type.builtin"] = M.{ link = "Type" },, --builtin types
        -- ["@type.definition"] = M.{ link = "Typedef" },, -- typedefs
        -- ["@type.qualifier"]

        ["@attribute"] = { link = "Function" }, -- attributes, like <decorators> in python
        -- ["@property"] = { guifg =palette.property }, --same as TSField

        -- functions
        ["@function"] = { link = "Function" }, -- functions
        ["@function.builtin"] = { link = "Function" }, --builtin functions
        -- ["@function.macro"] = { link = "Macro" }, -- macro defined functions
        -- ["@function.call"]
        -- ["@function.method"]
        -- ["@function.method.call"]

        -- ["@constructor"] = { guifg =palette.constant, gui =config.code_style.functions }, -- constructor calls and definitions
        ["@constructor.lua"] = {
            guifg = palette.alt,
        }, -- constructor calls and definitions, `= { }` in lua
        ["@operator"] = { link = "Operator" }, -- operators, like `+`

        -- keywords
        ["@keyword"] = {
            guifg = palette.keyword,
        }, -- keywords that don't fall in previous categories
        ["@keyword.exception"] = { link = "Exception" }, -- exception related keywords
        -- ["@keyword.import"] = M.{ link = "PreProc" },, -- keywords used to define a function
        ["@keyword.conditional"] = {
            guifg = palette.keyword,
        }, -- keywords for conditional statements
        ["@keyword.operator"] = {
            guifg = palette.keyword,
        }, -- keyword operator (eg, 'in' in python)
        ["@keyword.return"] = {
            guifg = palette.keyword,
        }, -- keywords used to define a function
        -- ["@keyword.function"] = M.{ link = "Function" },, -- keywords used to define a function
        -- ["@keyword.import"] = M.{ link = "Include" },, -- includes, like '#include' in c, 'require' in lua
        -- ["@keyword.storage"] = M.{ link = "StorageClass" },, -- visibility/life-time 'static'
        -- ["@keyword.repeat"] = M.{ link = "Repeat" },, -- for keywords related to loops

        -- punctuation
        ["@punctuation.delimiter"] = { guifg = palette.fg }, -- delimiters, like `; . , `
        ["@punctuation.bracket"] = {
            guifg = palette.operator,
        }, -- brackets and parentheses
        ["@punctuation.special"] = { link = "SpecialChar" }, -- punctuation that does not fall into above categories, like `{}` in string interpolation

        -- comment
        -- ["@comment"]
        ["@comment.error"] = {
            guifg = Util.blend(palette.comment, 0.4, palette.diag_red),
            gui = "bolditalic",
        },
        ["@comment.warning"] = {
            guifg = Util.blend(palette.comment, 0.4, palette.diag_yellow),
            gui = "bolditalic",
        },
        ["@comment.note"] = {
            guifg = Util.blend(palette.comment, 0.4, palette.diag_blue),
            gui = "bolditalic",
        },

        -- markup
        ["@markup"] = { guifg = palette.fg }, -- text in markup language
        ["@markup.strong"] = { guifg = palette.fg, gui = "bold" }, -- bold
        ["@markup.italic"] = { guifg = palette.fg, gui = "italic" }, -- italic
        ["@markup.underline"] = { guifg = palette.fg, gui = "underline" }, -- underline
        ["@markup.strikethrough"] = {
            guifg = palette.comment,
            gui = "strikethrough",
        }, -- strikethrough
        ["@markup.heading"] = {
            guifg = palette.keyword,
        }, -- markdown titles
        ["@markup.quote.markdown"] = { guifg = palette.comment }, -- quotes with >
        ["@markup.link.uri"] = { guifg = palette.alt, gui = "underline" }, -- urls, links, emails
        ["@markup.link"] = { guifg = palette.type }, -- text references, footnotes, citations, etc
        ["@markup.list"] = { guifg = palette.func },
        ["@markup.list.checked"] = { guifg = palette.func }, -- todo checked
        ["@markup.list.unchecked"] = { guifg = palette.func }, -- todo unchecked
        ["@markup.raw"] = { guifg = palette.func }, -- inline code in markdown
        ["@markup.math"] = { guifg = palette.type }, -- math environments, like `$$` in latex

        -- diff
        ["@diff.plus"] = { guifg = palette.diag_green }, -- added text (diff files
        ["@diff.minus"] = { guifg = palette.diag_red }, -- removed text (diff files
        ["@diff.delta"] = { guifg = palette.diag_blue }, -- changed text (diff files

        -- tags
        -- ["@tag"]
        ["@tag.attribute"] = { link = "Identifier" }, -- tags, like in html
        ["@tag.delimiter"] = { guifg = palette.fg }, -- tag delimiter < >
    }
end

return M
