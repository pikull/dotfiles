local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.initial_cols = 172
config.initial_rows = 50

config.font_size = 14
config.font = wezterm.font("FiraCode Nerd Font Mono")

config.color_scheme = "Catppuccin Mocha"

config.window_background_opacity = 0.94
config.macos_window_background_blur = 15

config.window_decorations = "RESIZE"
config.window_padding = { left = "1.5cell", right = "1.5cell", top = "1.5cell", bottom = "1.5cell" }

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

return config
