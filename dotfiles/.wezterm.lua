local wezterm = require 'wezterm'


local act = wezterm.action

local config = {
}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'AdventureTime'
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true

config.window_decorations = "RESIZE"

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.8,
}

config.adjust_window_size_when_changing_font_size = false

config.window_frame = {
  font = wezterm.font { family = "Noto Sans", weight = "Regular"},
}


config.disable_default_key_bindings = false
-- config.font = wezterm.font("M+1Code Nerd Font")
config.font_size = 12.0
config.keys = {
  {
  key = 'w',
  mods = 'SHIFT|CTRL',
  action = act.CloseCurrentPane { confirm = true },
  },
}
config.window_background_opacity = 0.5


wezterm.on("new-tab", function(tab)
   tab.current_pane:send_pane_command("bash")
end)

return config

