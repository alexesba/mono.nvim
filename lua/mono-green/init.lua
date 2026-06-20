local colors = require('mono-green.colors')
local config = require('mono-green.config')
local highlights = require('mono-green.highlights')

local M = {}

local function set_terminal_colors()
  local c = colors
  vim.g.terminal_color_0 = c.black
  vim.g.terminal_color_1 = c.green
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = c.green
  vim.g.terminal_color_4 = c.green
  vim.g.terminal_color_5 = c.green
  vim.g.terminal_color_6 = c.green
  vim.g.terminal_color_7 = c.green
  vim.g.terminal_color_8 = c.green
  vim.g.terminal_color_9 = c.green
  vim.g.terminal_color_10 = c.green
  vim.g.terminal_color_11 = c.green
  vim.g.terminal_color_12 = c.green
  vim.g.terminal_color_13 = c.green
  vim.g.terminal_color_14 = c.green
  vim.g.terminal_color_15 = c.green
  vim.g.terminal_color_background = c.background
  vim.g.terminal_color_foreground = c.foreground
end

local function apply_overrides()
  local overrides = type(config.overrides) == 'function' and config.overrides() or config.overrides
  if type(overrides) ~= 'table' then
    return
  end

  for group, parameters in pairs(overrides) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

---@param values table|nil
function M.setup(values)
  setmetatable(config, { __index = vim.tbl_extend('force', config.defaults, values or {}) })
end

function M.colorscheme()
  vim.o.background = 'dark'
  vim.o.termguicolors = true
  vim.cmd('hi clear')
  if vim.fn.exists('syntax_on') == 1 then
    vim.cmd('syntax reset')
  end

  if config.terminal then
    set_terminal_colors()
  end

  local groups = highlights.get_groups(colors, config)
  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end

  vim.g.colors_name = 'mono-green'
  apply_overrides()
end

return M
