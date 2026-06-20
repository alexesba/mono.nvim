--- Gogh Mono Green palette.
--- Source: https://github.com/Gogh-Co/Gogh/blob/master/themes/Mono%20Green.yml
local M = {
  background = '#022B00',
  foreground = '#0BFF00',
  black = '#034000',
  green = '#0BFF00',
  cursor = '#0BFF00',
}

M.ui = {
  bg = M.background,
  fg = M.foreground,
  dim = M.black,
  line = M.black,
  selection = M.black,
  float = M.background,
  border = M.black,
}

return M
