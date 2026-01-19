# name: gyokuro colors for nushell
# url: https://github.com/nushell/nushell
# upstream: https://github.com/cdmill/neomodern.nvim/raw/main/extras/
# author: Casey Miller

# 1. copy to ~/.config/nushell/themes/gyokuro.nu
# 2. load in your config.nu:
#       source ~/.config/nushell/themes/gyokuro.nu

let theme = {
alt: "#94A991",
bg: "#1b1c1d",
comment: "#6B6B67",
constant: "#868db5",
fg: "#AFB0A6",
func: "#61765E",
keyword: "#799475",
line: "#232425",
number: "#d6a9b3",
operator: "#b08c7d",
property: "#748fa6",
string: "#a69e6f",
type: "#AFBFAC",
visual: "#2D2E2F",
diag_red: "#E3878A",
diag_blue: "#829FE1",
diag_yellow: "#AC9569",
diag_green: "#698E6F",
}

$env.config.color_config = {
separator: $theme.comment
leading_trailing_space_bg: { attr: n }
header: $theme.keyword
empty: $theme.property
bool: $theme.number
int: $theme.number
float: $theme.number
filesize: $theme.number
duration: $theme.type
datetime: $theme.property
range: $theme.string
string: $theme.type
nothing: $theme.comment
binary: $theme.constant
cellpath: $theme.string
row_index: $theme.keyword
record: $theme.property
list: $theme.property
block: $theme.property
hints: $theme.comment
search_result: { fg: $theme.property bg: $theme.visual }

shape_and: { fg: $theme.keyword }
shape_binary: $theme.operator
shape_block: $theme.property
shape_bool: $theme.number
shape_closure: $theme.func
shape_custom: $theme.func
shape_datetime: { fg: $theme.string attr: b }
shape_directory: $theme.string
shape_external: $theme.func
shape_externalarg: $theme.alt
shape_filepath: $theme.type
shape_flag: { fg: $theme.alt attr: b }
shape_float: $theme.number
shape_garbage: { fg: $theme.fg bg: "#E3878A" attr: b }
shape_globpattern: { fg: $theme.type attr: b }
shape_int: $theme.number
shape_internalcall: $theme.func
shape_keyword: $theme.keyword
shape_list: $theme.string
shape_literal: $theme.string
shape_match_pattern: $theme.type
shape_matching_brackets: { fg: $theme.fg attr: b }
shape_nothing: $theme.comment
shape_operator: $theme.operator
shape_or: $theme.keyword
shape_pipe: $theme.operator
shape_range: $theme.string
shape_record: $theme.string
shape_redirection: $theme.operator
shape_signature: $theme.func
shape_string: $theme.string
shape_string_interpolation: $theme.alt
shape_table: { fg: $theme.property attr: b }
show_variable: $theme.fg
shape_vardec1: { fg: $theme.fg attr: u }
}

$env.config.highlight_resolved_externals = true
$env.config.explore = {
status_bar_background: { fg: $theme.fg, bg: $theme.line },
command_bar_text: { fg: $theme.fg },
highlight: { fg: $theme.type, bg: $theme.visual },
status: {
error: $theme.diag_red,
warn: $theme.diag_yellow,
info: $theme.diag_blue,
},
selected_cell: { bg: $theme.line fg: $theme.type },

}
