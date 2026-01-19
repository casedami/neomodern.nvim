local M = {}

function M.get()
    local colors = require("neomodern.terminal").colors(true)
    local c = {
        norm = colors.blue,
        ins = colors.yellow,
        vis = colors.purple,
        rep = colors.cyan,
        comm = colors.orange,
        fg_dim = colors.comment,
        vcs = colors.alt,
        bg_b = colors.visual,
        bg_c = colors.line,
        dark = colors.bg,
        none = "none",
    }

    local hl = {}

    hl.normal = {
        a = {
            bg = c.norm,
            fg = c.dark,
            gui = "bold",
        },
        b = { bg = c.bg_b, fg = c.vcs },
        c = { bg = c.bg_c, fg = c.fg_dim },
    }

    hl.insert = {
        a = {
            bg = c.ins,
            fg = c.dark,
            gui = "bold",
        },
    }

    hl.visual = {
        a = {
            bg = c.vis,
            fg = c.dark,
            gui = "bold",
        },
    }

    hl.replace = {
        a = {
            bg = c.rep,
            fg = c.dark,
            gui = "bold",
        },
    }

    hl.command = {
        a = {
            bg = c.comm,
            fg = c.dark,
            gui = "bold",
        },
    }

    return hl
end

return M
