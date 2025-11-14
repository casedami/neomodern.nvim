local M = {}
local URL = "https://github.com/cdmill/neomodern.nvim/raw/main/extras/"

---@alias Extra {name: string, ext:string, url:string, label:string}

--- @type table<Extra>
local extras = {
    -- stylua: ignore start
    { name = "alacritty", ext = ".toml", url = "https://github.com/alacritty/alacritty", label = "Alacritty"},
    { name = "fish", ext = ".fish", url = "https://fishshell.com/docs/current/index.html", label = "Fish"},
    { name = "fish_themes", ext = ".theme", url = "https://fishshell.com/docs/current/interactive.html#syntax-highlighting", label = "Fish Themes"},
    { name = "foot", ext = ".ini", url = "https://codeberg.org/dnkl/foot", label = "Foot"},
    { name = "fzf",  ext = ".zsh", url = "https://github.com/junegunn/fzf", label = "Fzf"},
    { name = "ghostty",  ext = "", url = "https://github.com/ghostty-org/ghostty", label = "Ghostty"},
    { name = "hyprland",  ext = ".conf", url = "https://github.com/hyprwm/Hyprland", label = "Hyprland" },
    { name = "kitty", ext = ".conf", url = "https://sw.kovidgoyal.net/kitty/conf.html", label = "Kitty"},
    { name = "nushell",  ext = ".nu", url = "https://github.com/nushell/nushell", label = "Nushell" },
    { name = "waybar",  ext = ".css", url = "https://github.com/Alexays/Waybar", label = "Waybar" },
    { name = "wezterm", ext = ".toml", url = "https://wezfurlong.org/wezterm/config/files.html", label = "WezTerm"},
    { name = "windows_terminal", ext = ".json", url = "https://aka.ms/terminal-documentation", label = "Windows Terminal"},
    { name = "yazi",  ext = ".toml", url = "https://github.com/sxyazi/yazi", label = "Yazi"},
    -- stylua: ignore end
}

---@param contents string file contents (extra theme)
---@param fname string filename to save extra
local function write(contents, fname)
    vim.fn.mkdir(vim.fs.dirname("extras/" .. fname), "p")
    local file = io.open("extras/" .. fname, "w")
    if file then
        file:write(contents)
        file:close()
    end
end

function M.generate()
    local themes = require("neomodern.palette").themes
    for _, e in ipairs(extras) do
        package.loaded["neomodern.extras." .. e.name] = nil
        local template = require("neomodern.extras.templates." .. e.name)
        for _, theme in pairs(themes) do
            local palette = require("neomodern.palette").get({
                theme = theme,
                variant = "dark",
                flat = true,
            })
            local fname = e.name .. "/" .. theme .. e.ext
            write(
                template.generate(palette, {
                    extra = e.label,
                    url = e.url,
                    upstream = URL .. fname,
                    theme = string.upper(theme),
                }),
                fname
            )
        end
    end
end

return M
