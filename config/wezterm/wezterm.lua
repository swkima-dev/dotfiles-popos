local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.automatically_reload_config = true

-- Font
config.font = wezterm.font_with_fallback({
  { family = "Hack Nerd Font Mono"},
  { family = "Noto Sans CJK JP"},
})
config.font_size = 14.0
config.use_ime = true

-- Window
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}
config.window_background_opacity = 0.45
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}
config.window_background_gradient = {
  colors = { "#000000" },
}

config.show_new_tab_button_in_tab_bar = false
-- タブ同士の境界線を非表示
config.colors = {
  tab_bar = {
    inactive_tab_edge = "none",
  },
}

-- タブの形をカスタマイズ
-- タブの左側の装飾
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
-- タブの右側の装飾
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#4c566A"
  local foreground = "#FFFFFF"
  local edge_background = "none"
  if tab.is_active then
    background = "#5e81ac"
    foreground = "#FFFFFF"
  end
  local edge_foreground = background
  local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "
  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)
-- General
config.term = "xterm-256color"

return config
