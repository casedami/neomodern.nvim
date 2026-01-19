---@type neomodern.Extra
local M = {
    name = "fzf",
    ext = nil,
    url = "https://github.com/junegunn/fzf",
    template = [=[
--color=fg:#${comment},bg:#${bg},hl:#${type},gutter:#${bg}
--color=fg+:#${alt},bg+:#${line},hl+:#${type}
--color=info:#${constant},prompt:#${func},pointer:#${property}
--color=marker:#${keyword},spinner:#${keyword},header:#${keyword}
]=],
}

return M
