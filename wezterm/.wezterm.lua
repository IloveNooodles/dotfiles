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
config.color_scheme = "Catppuccin Mocha (Gogh)"
config.font = wezterm.font_with_fallback({
	{ family = "MesloLGS NF", scale = 1.2 },
})
config.font_size = 16.0

-- config.window_background_opacity = 1.0
-- config.window_decorations = "RESIZE"

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

-- tmux status
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 1 then
		ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#b7bdf8" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
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
