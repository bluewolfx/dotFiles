local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Nightfly color scheme
config.colors = {
  foreground = '#c3ccdc',
  background = '#011627',
  cursor_bg = '#9ca1aa',
  cursor_fg = '#080808',
  cursor_border = '#9ca1aa',
  selection_fg = '#080808',
  selection_bg = '#b2ceee',
  
  scrollbar_thumb = '#2c3043',
  split = '#2c3043',
  
  ansi = {
    '#1d3b53', -- black
    '#fc514e', -- red
    '#a1cd5e', -- green
    '#e3d18a', -- yellow
    '#82aaff', -- blue
    '#c792ea', -- magenta
    '#7fdbca', -- cyan
    '#a1aab8', -- white
  },
  
  brights = {
    '#7c8f8f', -- bright black
    '#ff5874', -- bright red
    '#21c7a8', -- bright green
    '#ecc48d', -- bright yellow
    '#82aaff', -- bright blue
    '#ae81ff', -- bright magenta
    '#7fdbca', -- bright cyan
    '#d6deeb', -- bright white
  },
}

-- Optional: Additional configuration
config.font_size = 11
config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })
config.window_background_opacity = 1.0
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

-- Set PowerShell 7 as default shell
config.default_prog = { 'pwsh.exe' }

return config
