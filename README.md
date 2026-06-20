# mono-green.nvim

A Neovim colorscheme based on the [Mono Green](https://github.com/Gogh-Co/Gogh/blob/master/themes/Mono%20Green.yml) theme from [Gogh](https://gogh-co.github.io/Gogh/).

It is a dark, monochromatic green theme: bright phosphor green text on a deep green background. Because the Gogh palette uses a single foreground color for almost every ANSI slot, syntax is differentiated with bold, italic, and underline rather than hue.

## Requirements

- Neovim 0.8+
- A terminal with truecolor support (`set termguicolors` is enabled automatically)

## Installation

### lazy.nvim

Add the plugin to your spec. Use a local path while developing, or point to your Git remote once published:

```lua
{
  "alexesba/mono-green.nvim",
  -- Local development:
  -- dir = "~/Projects/mono-green",
  lazy = false,
  priority = 1000,
  config = function()
    require("mono-green").setup()
    vim.cmd.colorscheme("mono-green")
  end,
}
```

### packer.nvim

```lua
use({
  "alexesba/mono-green.nvim",
  config = function()
    require("mono-green").setup()
    vim.cmd.colorscheme("mono-green")
  end,
})
```

### Manual

Clone the repository and add it to your runtime path:

```sh
git clone https://github.com/alexesba/mono-green.nvim ~/.local/share/nvim/site/pack/plugins/start/mono-green.nvim
```

Then enable it in your config:

```lua
require("mono-green").setup()
vim.cmd.colorscheme("mono-green")
```

## Usage

Call `setup()` before applying the colorscheme if you want to change any options:

```lua
require("mono-green").setup({
  terminal = true,
  italic_comments = true,
  italic_strings = true,
  bold_keywords = true,
})

vim.cmd.colorscheme("mono-green")
```

You can also set the colorscheme without `setup()` — defaults are used automatically:

```lua
vim.cmd.colorscheme("mono-green")
```

To reload after changing config during a session:

```vim
:lua require("mono-green").setup({ bold_keywords = false })
:colorscheme mono-green
```

## Configuration

| Option | Default | Description |
|--------|---------|-------------|
| `terminal` | `true` | Set `:terminal` ANSI colors to match the Gogh palette |
| `italic_comments` | `true` | Render comments in italic |
| `italic_strings` | `true` | Render strings in italic |
| `bold_keywords` | `true` | Render keywords in bold |
| `overrides` | `{}` | Custom highlight groups (table or function returning a table) |

### Custom highlights

Override any highlight group after the theme is applied:

```lua
require("mono-green").setup({
  overrides = {
    CursorLine = { bg = "#034000" },
    LineNr = { fg = "#0BFF00" },
  },
})
```

Or use a function:

```lua
require("mono-green").setup({
  overrides = function()
    return {
      ["@function"] = { bold = false, underline = true },
    }
  end,
})
```

## Palette

Colors are taken directly from the Gogh Mono Green theme:

| Name | Hex | Gogh role |
|------|-----|-----------|
| Background | `#022B00` | Background |
| Foreground | `#0BFF00` | Foreground / ANSI 2–16 |
| Black | `#034000` | ANSI 0 (host / dim) |
| Cursor | `#0BFF00` | Cursor |

## Highlighting approach

| Element | Style |
|---------|-------|
| Comments | Dim green + italic |
| Strings | Italic |
| Keywords | Bold |
| Functions | Bold |
| Types | Underline |
| Constants / numbers | Bold |
| Search / errors | Reverse video |
| Diagnostics | Bold, underline, or undercurl |

Treesitter, LSP diagnostics, Git signs, Telescope, Cmp, Blink Cmp, Neo-tree, NvimTree, Which-key, and Mini.statusline are supported.

## Matching your terminal

If you use the Gogh Mono Green theme in your terminal (kitty, Ghostty, WezTerm, etc.), Neovim and your shell will share the same palette. With `terminal = true`, Neovim's built-in terminal also uses the Gogh ANSI colors.

Example with Gogh:

```sh
gogh install "Mono Green"
```

## Project structure

```
mono-green/
├── colors/mono-green.lua       # colorscheme entry point
└── lua/mono-green/
    ├── init.lua                # setup() and colorscheme()
    ├── colors.lua              # Gogh palette
    ├── config.lua              # default options
    └── highlights.lua          # highlight groups
```

## Credits

- [Gogh](https://github.com/Gogh-Co/Gogh) — original Mono Green terminal theme
