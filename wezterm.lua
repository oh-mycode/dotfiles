local wezterm = require("wezterm")

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.enable_tab_bar = false
config.color_scheme = "Catppuccin Mocha"
-- config.font = wezterm.font("Hack Nerd Font")
-- config.font = wezterm.font("MesloLGS NF")
-- config.font = wezterm.font("Mononoki Nerd Font")
config.font_size = 13
config.window_background_opacity = 1
config.macos_window_background_blur = 30
config.window_decorations = "RESIZE"

config.keys = {
	{
		key = "f",
		mods = "CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

return config
