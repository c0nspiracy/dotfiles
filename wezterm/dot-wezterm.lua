local wezterm = require("wezterm")

return {
  font = wezterm.font("VictorMono Nerd Font", { weight = "Medium" }),
  font_size = 18.0,
  color_scheme = "Catppuccin Macchiato",
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  send_composed_key_when_left_alt_is_pressed = true,
}
