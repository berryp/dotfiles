local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night'
config.font = wezterm.font 'Fira Code'
config.audible_bell = 'Disabled'
config.initial_cols = 160
config.initial_rows = 48

return config
