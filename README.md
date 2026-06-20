# mono.nvim

Neovim colorschemes based on the [Gogh Mono](https://github.com/Gogh-Co/Gogh) terminal themes. Each variant is a dark, monochromatic phosphor-style theme with a single foreground hue on a deep background.

Because the Gogh palettes use one color for almost every ANSI slot, syntax is differentiated with bold, italic, and underline rather than hue.

## Variants

| Colorscheme | Gogh theme | Foreground | Background |
|-------------|------------|------------|------------|
| `mono` | Mono Green (default) | `#0BFF00` | `#022B00` |
| `mono-green` | Mono Green | `#0BFF00` | `#022B00` |
| `mono-amber` | Mono Amber | `#FF9400` | `#2B1900` |
| `mono-cyan` | Mono Cyan | `#00CCFF` | `#00222B` |
| `mono-red` | Mono Red | `#FF3600` | `#2B0C00` |
| `mono-white` | Mono White | `#FAFAFA` | `#262626` |
| `mono-yellow` | Mono Yellow | `#FFD300` | `#2B2400` |

Looking for a programmer-focused phosphor theme with syntax luminance steps? See [matrix-pro.nvim](https://github.com/alexesba/matrix-pro.nvim).

## Requirements

- Neovim 0.8+
- A terminal with truecolor support (`set termguicolors` is enabled automatically)

## Installation

### lazy.nvim

```lua
{
  "alexesba/mono.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("mono").setup()
    vim.cmd.colorscheme("mono")
  end,
}
```

Pick any variant:

```lua
vim.cmd.colorscheme("mono-cyan")
```

### packer.nvim

```lua
use({
  "alexesba/mono.nvim",
  config = function()
    require("mono").setup()
    vim.cmd.colorscheme("mono")
  end,
})
```

### Manual

```sh
git clone https://github.com/alexesba/mono.nvim ~/.local/share/nvim/site/pack/plugins/start/mono.nvim
```

Then enable a variant in your config:

```lua
require("mono").setup()
vim.cmd.colorscheme("mono-amber")
```

## Usage

Call `setup()` before applying the colorscheme if you want to change options:

```lua
require("mono").setup({
  style = "cyan",
  terminal = true,
  italic_comments = true,
  italic_strings = true,
  bold_keywords = true,
})

vim.cmd.colorscheme("mono-cyan")
```

You can also load variants directly without setting `style` in setup:

```lua
require("mono").setup()
vim.cmd.colorscheme("mono-red")
```

Each `colors/mono-*.lua` entry point sets the matching Gogh palette automatically, similar to [sonokai](https://github.com/sontungexpt/sonokai).

To reload after changing config:

```vim
:lua require("mono").setup({ bold_keywords = false })
:colorscheme mono
```

## Configuration

| Option | Default | Description |
|--------|---------|-------------|
| `style` | `"green"` | Active palette: `green`, `amber`, `cyan`, `red`, `white`, or `yellow` |
| `terminal` | `true` | Set `:terminal` ANSI colors to match the Gogh palette |
| `italic_comments` | `true` | Render comments in italic |
| `italic_strings` | `true` | Render strings in italic |
| `bold_keywords` | `true` | Render keywords in bold |
| `overrides` | `{}` | Custom highlight groups (table or function returning a table) |

### Custom highlights

```lua
require("mono").setup({
  overrides = {
    CursorLine = { bg = "#034000" },
  },
})
```

Or with a function:

```lua
require("mono").setup({
  overrides = function()
    return {
      ["@function"] = { bold = false, underline = true },
    }
  end,
})
```

## Highlighting approach

| Element | Style |
|---------|-------|
| Comments | Dim + italic |
| Strings | Italic |
| Keywords | Bold |
| Functions | Bold |
| Types | Underline |
| Constants / numbers | Bold |
| Search / errors | Reverse video |
| Diagnostics | Bold, underline, or undercurl |

Treesitter, LSP diagnostics, Git signs, Telescope, Cmp, Blink Cmp, Neo-tree, NvimTree, Which-key, and Mini.statusline are supported.

## Matching your terminal

Install the matching Gogh theme so your terminal and Neovim share the same palette:

```sh
gogh install "Mono Green"
gogh install "Mono Cyan"
```

With `terminal = true`, Neovim's built-in terminal also uses the Gogh ANSI colors for the active variant.

## Project structure

```
mono.nvim/
├── colors/
│   ├── mono.lua              # default (green)
│   ├── mono-green.lua
│   ├── mono-amber.lua
│   ├── mono-cyan.lua
│   ├── mono-red.lua
│   ├── mono-white.lua
│   └── mono-yellow.lua
└── lua/mono/
    ├── init.lua              # setup() and colorscheme()
    ├── colors.lua            # Gogh palettes
    ├── config.lua            # options
    └── highlights.lua        # highlight groups
```

## Credits

- [Gogh](https://github.com/Gogh-Co/Gogh) — original Mono terminal themes
