-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Macchiato (Gogh)'
config.enable_tab_bar = false
config.font_size = 16.0
config.font = wezterm.font('MesloLGS NF')

config.window_background_opacity = 1.0
config.window_decorations = 'RESIZE'

-- and finally, return the configuration to wezterm
return config
