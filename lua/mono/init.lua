local colors = require('mono.colors')
local config = require('mono.config')
local highlights = require('mono.highlights')

local M = {}

local function set_terminal_colors(palette)
  vim.g.terminal_color_0 = palette.black
  for i = 1, 15 do
    vim.g['terminal_color_' .. i] = palette.accent
  end
  vim.g.terminal_color_background = palette.background
  vim.g.terminal_color_foreground = palette.foreground
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

local function resolve_colors_name()
  if config.colors_name then
    return config.colors_name
  end

  if config.style == 'green' then
    return 'mono'
  end

  return 'mono-' .. config.style
end

---@param values table|nil
function M.setup(values)
  setmetatable(config, { __index = vim.tbl_extend('force', config.defaults, values or {}) })
end

---@param style string|nil
function M.colorscheme(style)
  if style then
    config.style = style
    config.colors_name = nil
  end

  vim.o.background = 'dark'
  vim.o.termguicolors = true
  vim.cmd('hi clear')
  if vim.fn.exists('syntax_on') == 1 then
    vim.cmd('syntax reset')
  end

  local palette = colors.get(config.style)
  if config.terminal then
    set_terminal_colors(palette)
  end

  local groups = highlights.get_groups(palette, config)
  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end

  vim.g.colors_name = resolve_colors_name()
  apply_overrides()
end

return M
