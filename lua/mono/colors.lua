--- Gogh Mono palettes.
--- Source: https://github.com/Gogh-Co/Gogh/tree/master/themes
local M = {}

---@type table<string, table<string, string>>
M.palettes = {
  green = {
    background = '#022B00',
    foreground = '#0BFF00',
    black = '#034000',
    accent = '#0BFF00',
    cursor = '#0BFF00',
  },
  amber = {
    background = '#2B1900',
    foreground = '#FF9400',
    black = '#402500',
    accent = '#FF9400',
    cursor = '#FF9400',
  },
  cyan = {
    background = '#00222B',
    foreground = '#00CCFF',
    black = '#003340',
    accent = '#00CCFF',
    cursor = '#00CCFF',
  },
  red = {
    background = '#2B0C00',
    foreground = '#FF3600',
    black = '#401200',
    accent = '#FF3600',
    cursor = '#FF3600',
  },
  white = {
    background = '#262626',
    foreground = '#FAFAFA',
    black = '#3B3B3B',
    accent = '#FAFAFA',
    cursor = '#FAFAFA',
  },
  yellow = {
    background = '#2B2400',
    foreground = '#FFD300',
    black = '#403500',
    accent = '#FFD300',
    cursor = '#FFD300',
  },
}

---@param style string|nil
---@return table
function M.get(style)
  local palette = M.palettes[style or 'green'] or M.palettes.green

  return {
    background = palette.background,
    foreground = palette.foreground,
    black = palette.black,
    accent = palette.accent,
    cursor = palette.cursor,
    ui = {
      bg = palette.background,
      fg = palette.foreground,
      dim = palette.black,
      line = palette.black,
      selection = palette.black,
      float = palette.background,
      border = palette.black,
    },
  }
end

return M
