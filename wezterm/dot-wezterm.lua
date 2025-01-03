local wezterm = require("wezterm")

local fonts = {
  victor_mono = wezterm.font {
    family = "VictorMono Nerd Font",
    weight = "Medium",
  },
  berkeley_mono = wezterm.font {
    family = "Berkeley Mono",
    weight = "Regular",
    harfbuzz_features = {
      'ss01=1', -- Slashed zero (0)
      'ss06=1', -- Slashed seven (7)
    },
  },
  sf_pro = wezterm.font {
    family = "SF Pro",
    weight = "Regular",
  },
}

return {
  font = fonts.victor_mono,
  font_size = 18.0,
  color_scheme = "Catppuccin Macchiato",
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  send_composed_key_when_left_alt_is_pressed = true,
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "RESIZE",
}
