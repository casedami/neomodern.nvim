# name: gyokuro colors for fish
# url: https://fishshell.com/docs/current/index.html
# upstream: https://github.com/cdmill/neomodern.nvim/raw/main/extras/
# author: Casey Miller

# use in ~/.config/fish/conf.d/

# preferred bg: 1b1c1d

### Full palette. 
### Colors defined in neomdern/palette/gyokuro.lua
set -g alt 94A991
set -g constant 868db5
set -g comment 6B6B67
set -g fg AFB0A6
set -g func 61765E
set -g keyword 799475
set -g number d6a9b3
set -g operator b08c7d
set -g property 748fa6
set -g str a69e6f
set -g type AFBFAC

# Syntax Highlighting Colors
set -g fish_color_normal AFB0A6
set -g fish_color_command 61765E
set -g fish_color_keyword 799475
set -g fish_color_quote a69e6f
set -g fish_color_redirection 868db5
set -g fish_color_end b08c7d
set -g fish_color_error E3878A
set -g fish_color_param AFB0A6
set -g fish_color_valid_path AFBFAC
set -g fish_color_option 94A991
set -g fish_color_comment 6B6B67
set -g fish_color_selection --background=232425
set -g fish_color_operator b08c7d
set -g fish_color_escape 799475
set -g fish_color_autosuggestion 6B6B67
set -g fish_color_cwd a69e6f
set -g fish_color_hostname d6a9b3
set -g fish_color_status E3878A
set -g fish_color_cancel d6a9b3
set -g fish_color_search_match --background=232425

# Completion Pager Colors
set -g fish_pager_color_progress 94A991
set -g fish_pager_color_prefix AFBFAC
set -g fish_pager_color_completion AFB0A6
set -g fish_pager_color_description 6B6B67
set -g fish_pager_color_selected_prefix 94A991
set -g fish_pager_color_selected_completion 94A991
set -g fish_pager_color_selected_background --background=232425
