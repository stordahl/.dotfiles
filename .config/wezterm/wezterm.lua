local wezterm = require "wezterm"
local k = require("utils/keys")

local act = wezterm.action

local function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

local config = {}

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

config.enable_tab_bar = false
config.window_decorations = "RESIZE"


config.window_frame = {
  font = wezterm.font { family = 'GeistMono Nerd Font' },
  font_size = 12.0,
}

config.keys = {
  {
    key = 'p',
    mods = 'CMD',
    action = act.ActivateCommandPalette,
  },
  k.cmd_key("K", act.SendKey({ mods = "CTRL", key = "k" })),
  k.cmd_to_tmux_prefix("1", "1"),
	k.cmd_to_tmux_prefix("2", "2"),
	k.cmd_to_tmux_prefix("3", "3"),
	k.cmd_to_tmux_prefix("4", "4"),
	k.cmd_to_tmux_prefix("5", "5"),
	k.cmd_to_tmux_prefix("6", "6"),
	k.cmd_to_tmux_prefix("7", "7"),
	k.cmd_to_tmux_prefix("8", "8"),
	k.cmd_to_tmux_prefix("9", "9"),
	k.cmd_to_tmux_prefix("t", "c"),
  k.cmd_to_tmux_prefix("w", "x"),
  k.cmd_key(
		"s",
		act.Multiple({
			act.SendKey({ key = "\x1b" }), -- escape
			k.multiple_actions(":w"),
		})
  ),
}

return config

