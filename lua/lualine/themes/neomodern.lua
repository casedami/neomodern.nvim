local lualine = function()
	---@type neomodern.Palette
	local palette = require("neomodern.palette").get(vim.g.colors_name, vim.o.background, {})
	local hl = {}

	hl.normal = {
		a = {
			bg = palette.spec.alt,
			fg = palette.spec.bg,
		},
		b = { bg = palette.spec.visual, fg = palette.spec.alt },
		c = { bg = palette.spec.line, fg = palette.spec.comment },
	}

	hl.insert = {
		a = {
			bg = palette.base16.bright_yellow,
			fg = palette.spec.bg,
		},
	}

	hl.visual = {
		a = {
			bg = palette.base16.bright_magenta,
			fg = palette.spec.bg,
		},
	}

	hl.replace = {
		a = {
			bg = palette.base16.bright_blue,
			fg = palette.spec.bg,
		},
	}

	hl.command = {
		a = {
			bg = palette.base16.bright_red,
			fg = palette.spec.bg,
		},
	}

	return hl
end

return lualine()
