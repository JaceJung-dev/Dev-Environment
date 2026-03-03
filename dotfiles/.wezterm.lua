-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Macchiato"
config.font_size = 19

-- Keep adding configuration options here

config.enable_tab_bar = false
config.window_background_opacity = 0.96
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}
-- config.window_decorations = "RESIZE"
-- config.macos_window_background_blur = 10

-- catppucchin_macchiato theme
config.colors = {
	selection_bg = "#6E738D",
	cursor_bg = "#F4DBD6",
	cursor_fg = "#24273A",
}

return config
