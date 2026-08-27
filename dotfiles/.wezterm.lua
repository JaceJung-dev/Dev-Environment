-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Macchiato"
config.font_size = 19

-- Keep adding configuration options here

-- Kitty keyboard protocol: Shift+Enter 등 modifier 조합을 앱이 구분할 수 있게 함
-- (앱이 명시적으로 요청할 때만 인코딩이 바뀜 / Ghostty 는 기본 ON)
config.enable_kitty_keyboard = true

-- Option+Enter 를 ToggleFullScreen 으로 먹지 않고 앱으로 넘김
config.keys = {
	{ key = "Enter", mods = "ALT", action = wezterm.action.DisableDefaultAssignment },
}

config.enable_tab_bar = true
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
