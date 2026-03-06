local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.automatically_reload_config = true

-- Font
config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 12.0
config.use_ime = true

-- Window
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}
config.window_background_opacity = 0.45

-- General
config.term = "xterm-256color"

return config
