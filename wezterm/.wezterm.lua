local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.enable_kitty_keyboard = true
-- config.enable_csi_u_key_encoding = true
config.term = "wezterm"
config.term = "xterm-256color"

-- For example, changing the color scheme:
local scheme = wezterm.get_builtin_color_schemes()["Catppuccin Mocha"]
if scheme then
	-- Softer than stock text/white for transparent blur (stock text is #cdd6f4)
	scheme.foreground = "#bac2de"
	scheme.ansi[8] = "#a6adc8"
	scheme.brights[8] = "#bac2de"
	config.color_schemes = {
		["Catppuccin Mocha Soft"] = scheme,
	}
	config.color_scheme = "Catppuccin Mocha Soft"
else
	config.color_scheme = "Catppuccin Mocha (Gogh)"
	config.colors = {
		foreground = "#bac2de",
		ansi = { [8] = "#a6adc8" },
		brights = { [8] = "#bac2de" },
	}
end

config.bold_brightens_ansi_colors = false
config.font = wezterm.font_with_fallback({
	{ family = "MesloLGS Nerd Font", scale = 1.2 },
	{ family = "HackGen Console NF", scale = 1.2 },
})
config.font_size = 16.0

-- config.window_decorations = "RESIZE"
config.window_background_opacity = 0.7
config.macos_window_background_blur = 20

config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = false
-- config.default_prog = { "/opt/homebrew/bin/tmux" }

-- tmux
config.leader = { key = "q", mods = "ALT", timeout_milliseconds = 2000 }
config.keys = {
	{
		mods = "LEADER",
		key = "c",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "b",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		mods = "LEADER",
		key = "n",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		mods = "LEADER",
		key = "|",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		mods = "LEADER",
		key = "LeftArrow",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "LEADER",
		key = "RightArrow",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "LEADER",
		key = "DownArrow",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		mods = "LEADER",
		key = "UpArrow",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		mods = "META",
		key = "LeftArrow",
		action = wezterm.action({ SendString = "\x1bb" }),
	},
	{
		mods = "META",
		key = "RightArrow",
		action = wezterm.action({ SendString = "\x1bf" }),
	},
	{
		mods = "CMD",
		key = "LeftArrow",
		action = wezterm.action({ SendString = "\x1bOH" }),
	},
	{
		mods = "CMD",
		key = "RightArrow",
		action = wezterm.action({ SendString = "\x1bOF" }),
	},
}

-- wezterm left status (leader indicator)
wezterm.on("update-right-status", function(window, _)
	local prefix = ""
	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
	end

	window:set_left_status(wezterm.format({
		{ Foreground = { Color = "#89b4fa" } }, -- sapphire/blue: readable on transparent blur
		{ Text = prefix },
	}))
end)

for i = 0, 9 do
	-- leader + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "META",
		action = wezterm.action.ActivateTab(i),
	})
end

-- and finally, return the configuration to wezterm
return config
