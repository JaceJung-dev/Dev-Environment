-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font_size = 19

-- Keep adding configuration options here
--

-- config.enable_tab_bar = false

-- config.window_decorations = "RESIZE"
-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 10

-- catppucchin_macchiato theme
config.colors = {
  foreground = "#CAD3F5",      -- Foreground Color
  background = "#24273A",      -- Background Color
  cursor_bg = "#F4DBD6",       -- Cursor Color
  cursor_border = "#F4DBD6",
  cursor_fg = "#24273A",       -- Cursor Text Color
  selection_bg = "#5B6078",    -- Selection Color
  selection_fg = "#CAD3F5",    -- Selected Text Color
  ansi = {"#494D64", "#ED8796", "#A6DA95", "#EED49F", "#8AADF4", "#F5BDE6", "#8BD5CA", "#A5ADCB"},
  brights = {"#5B6078", "#EC7486", "#8CCF7F", "#E1C682", "#78A1F6", "#F2A9DD", "#63CBC0", "#B8C0E0"},

  compose_cursor = "#F4DBD6", -- 링크/볼드 가독성(옵션)
}

return config
