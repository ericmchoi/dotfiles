local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.quit_when_all_windows_are_closed = false
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.harfbuzz_features = { "calt=0" }

config.leader = { key = "a", mods = "SUPER", timeout_milliseconds = 1000 }
config.keys = {
  {
    key = "v",
    mods = "LEADER",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "s",
    mods = "LEADER",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "h",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  {
    key = "LeftArrow",
    mods = "SUPER",
    action = wezterm.action.AdjustPaneSize({ "Left", 10 }),
  },
  {
    key = "RightArrow",
    mods = "SUPER",
    action = wezterm.action.AdjustPaneSize({ "Right", 10 }),
  },
  {
    key = "UpArrow",
    mods = "SUPER",
    action = wezterm.action.AdjustPaneSize({ "Up", 10 }),
  },
  {
    key = "DownArrow",
    mods = "SUPER",
    action = wezterm.action.AdjustPaneSize({ "Down", 10 }),
  },
}

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
