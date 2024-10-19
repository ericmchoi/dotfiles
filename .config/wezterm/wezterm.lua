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
config.check_for_updates = false

config.font = wezterm.font("Hack")
config.font_dirs = { "fonts" }
config.font_size = 14.0
config.front_end = "WebGpu"

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

config.color_scheme = "Kanagawa (Gogh)"

return config
