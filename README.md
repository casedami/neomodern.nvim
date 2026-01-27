# <p align="center"> *NEOMODERN*.nvim </p>

<p align="center">
modern — simple — unintrusive
</p>

<p align="center">
<img src="https://img.shields.io/github/v/tag/cdmill/neomodern.nvim?style=flat&label=RELEASE&labelColor=%23212123&color=%238a88db" />
<img src="https://img.shields.io/badge/BUILT_WITH_LUA-blue?style=flat&color=%23629da3" />
<img src="https://img.shields.io/badge/NEOVIM-0.9-blue?style=flat&logo=Neovim&labelColor=%23212123&color=%238a88db" />
</p>

## Table of Contents

- [Gallery](#gallery)
- [Installation](#installation)
- [Configuration](#configuration)
- [Customization](#customization)
- [Recipes](#recipes)
- [Contributing](#contributing)
- [Inspiration](inspiration)

## Gallery

### 🌚 MOON

A spacy, moon inspired theme

<details open>
<summary>Dark Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/moon-dark.png)

</details>

<details closed>
<summary>Light Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/moon-light.png)

</details>

### ❄️ *ICECLIMBER*

A theme with colors inspired from Nintendo's Ice Climbers characters

<details open>
<summary>Dark Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/iceclimber-dark.png)

</details>

<details closed>
<summary>Light Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/iceclimber-light.png)

</details>

### 🌱 *GYOKURO*

A fresh green tea inspired theme

<details open>
<summary>Dark Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/gyokuro-dark.png)

</details>

<details closed>
<summary>Light Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/gyokuro-light.png)

</details>

### 🍂 *HOJICHA*

A roasted green tea inspired theme

<details open>
<summary>Dark Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/hojicha-dark.png)

</details>

<details closed>
<summary>Light Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/hojicha-light.png)

</details>

### 🌷 *ROSEPRIME*

Inspired by [ThePrimeagen's](https://github.com/ThePrimeagen) use of the [Rosé-Pine](https://github.com/rose-pine/neovim) theme

<details open>
<summary>Dark Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/roseprime-dark.png)

</details>

<details closed>
<summary>Light Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/roseprime-light.png)

</details>

## Installation

Using vim.pack:

```lua
vim.pack.add({"https://github.com/casedami/neomodern.nvim"})
require("neomodern").setup({
-- optional configuration
})
require("neomodern").load()
```

Note, you only need to call setup if you are overriding any default opts. If
you are only using it to set the theme, you could use the following instead:

```lua
vim.pack.add({"https://github.com/casedami/neomodern.nvim"})
require("neomodern").load("iceclimber")
```

## Configuration

There are 5 themes included, each with a light and dark variant.
The light theme is used when `vim.o.background = "light"`.

Default options are given below:

```lua
require("neomodern").setup({
  -- 'default' default background
  -- 'alt' darker background
  -- 'transparent' background is not set
  bg = "default",

  theme = "moon", -- 'moon' | 'iceclimber' | 'gyokuro' | 'hojicha' | 'roseprime'

  gutter = {
    cursorline = false, -- highlight the cursorline in the gutter
    dark = false, -- highlight gutter darker than the Normal bg
  },

  diagnostics = {
    darker = true, -- use darker colors for diagnostics
    undercurl = true, -- use undercurl for diagnostics
    background = true, -- use a background color for diagnostics
  },

  -- override colors, see #Customization below
  overrides = {
    default = {},
    hlgroups = {}
  }
})
-- Call `load` after `setup`
require("neomodern").load()
```

## Customization

Neomodern supports user-defined color overrides. The user can either override
the default colors or alter the highlights of a specific highlight group. When
overriding highlight groups, use neomodern's colors by prefixing the color name
with a dollar sign (e.g. `$keyword`). See `:h highlight-args` and `:h
neomodern-types` for expected args, default color names, etc.

```lua
require("neomodern").setup {
  overrides = {
    default = {
      keyword = '#817faf', -- redefine neomodern's `keyword` color
    }
    hlgroups = {
      ["@keyword.return"] = { gui = 'italic' },
      ["@keyword"] = { guifg = "$keyword", gui = 'bold' },
      ["@function"] = { guibg = "#ffffff" },
      ["String"] = { link = "Todo" },
    }
  },
}
```

## Recipes

### Prefer Treesitter Highlights

If you would prefer to bias the highlights towards treesitter (rather than
lsp-semantic highlights), use this somewhere in your config:

```lua
vim.highlight.priorities.semantic_tokens = 95
```

### Keymap to Swap Between Light/Dark variants

Neomodern uses `vim.opt.background` to decide which variant to load, so to
toggle between variants simply toggle `vim.opt.background`.

```lua
vim.keymap.set("n", "<leader>uc", function()
    if vim.opt.background == "light" then
        vim.opt.background = "dark"
    else
        vim.opt.background = "light"
    end
end, { desc = "Toggle between light/dark mode" })
```

## Contributing

If you are wanting support for a plugin or an extra please open an issue or
submit a PR.

## Inspiration

- [OneDark.nvim](https://github.com/navarasu/onedark.nvim)
- [Bamboo.nvim](https://github.com/ribru17/bamboo.nvim)
- [Catppuccin](https://github.com/catppuccin/nvim)
- [Everforest](https://github.com/sainnhe/everforest)
- [Rosé-Pine](https://github.com/rose-pine/neovim)
- [TokyoNight](https://github.com/folke/tokyonight.nvim)
- [No Clown Fiesta](https://github.com/aktersnurra/no-clown-fiesta.nvim)
