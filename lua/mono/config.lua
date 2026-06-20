local M = {
  style = 'green',
  colors_name = nil,
  terminal = true,
  italic_comments = true,
  italic_strings = true,
  bold_keywords = true,
  overrides = {},
}

M.defaults = vim.deepcopy(M)

return M
