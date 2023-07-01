local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.quit_when_all_windows_are_closed = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.harfbuzz_features = { "calt=0" }

config.force_reverse_video_cursor = true
config.colors = {
  foreground = "#dcd7ba",
  background = "#1f1f28",

  cursor_bg = "#c8c093",
  cursor_fg = "#c8c093",
  cursor_border = "#c8c093",

  selection_fg = "#c8c093",
  selection_bg = "#2d4f67",

  scrollbar_thumb = "#16161d",
  split = "#16161d",

  ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
  brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
  indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
}

return config
