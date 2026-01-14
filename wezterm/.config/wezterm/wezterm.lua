local wezterm = require 'wezterm'
local mux = wezterm.mux
local config
if wezterm.config_builder then
	config = wezterm.config_builder()
end

local act = wezterm.action

-- WSL setting
config.default_domain = 'WSL:Ubuntu'
config.default_prog = { 'wsl.exe', '-d', 'Ubuntu' }

config.term = 'xterm-256color'
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

-- Visuals
config.font_size = 11
config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })
config.window_background_opacity = 1.0
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_csi_u_key_encoding = false

-- Mouse copy on select
config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'NONE',
		action = act.Multiple {
			act.CompleteSelection 'ClipboardAndPrimarySelection',
		},
	},
}

-- Keybinds to mimic Mac Style - alt keys
config.keys = {
	-- Tab Management
	{ key = 't',          mods = 'ALT', action = act.SpawnTab 'CurrentPaneDomain' },
	{ key = 'w',          mods = 'ALT', action = act.CloseCurrentTab { confirm = false } },

	-- Clipboard
	{ key = 'c',          mods = 'ALT', action = act.CopyTo 'Clipboard' },
	{ key = 'v',          mods = 'ALT', action = act.PasteFrom 'Clipboard' },

	-- Split Navigation (Alt + Arrows)
	{ key = 'LeftArrow',  mods = 'ALT', action = act.ActivatePaneDirection 'Left' },
	{ key = 'RightArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Right' },
	{ key = 'UpArrow',    mods = 'ALT', action = act.ActivatePaneDirection 'Up' },
	{ key = 'DownArrow',  mods = 'ALT', action = act.ActivatePaneDirection 'Down' },

	-- Split Panes
	{ key = '\\',         mods = 'ALT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
	{ key = '-',          mods = 'ALT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
	{ key = 'w',          mods = 'ALT', action = act.CloseCurrentPane { confirm = true } },
}

return config
