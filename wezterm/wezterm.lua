local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- OS判定してデフォルトシェルを設定
if wezterm.target_triple:find("windows") then
	config.default_domain = "WSL:Ubuntu"
end

-- フォント
config.font = wezterm.font("0xProto Nerd Font Mono")
config.font_size = 14.0

-- カラースキーム
config.color_scheme = "Catppuccin Mocha"

-- ウィンドウ
config.initial_cols = 120
config.initial_rows = 35
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95

-- タブバー
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.tab_max_width = 25

-- タブの色（Catppuccin Mocha風）
config.colors = {
	tab_bar = {
		background = "#1e1e2e",
		active_tab = {
			bg_color = "#cba6f7",
			fg_color = "#1e1e2e",
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = "#313244",
			fg_color = "#cdd6f4",
		},
		inactive_tab_hover = {
			bg_color = "#45475a",
			fg_color = "#cdd6f4",
		},
		new_tab = {
			bg_color = "#1e1e2e",
			fg_color = "#cdd6f4",
		},
		new_tab_hover = {
			bg_color = "#45475a",
			fg_color = "#cdd6f4",
		},
	},
	-- アクティブペインの枠線
	split = "#cba6f7", -- 分割線の色（紫）
}

-- ペインのフォーカス枠
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.6,
}

-- タブのフォーマット
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab.active_pane.title
	if #title > max_width - 3 then
		title = title:sub(1, max_width - 5) .. "..."
	end
	return " " .. (tab.tab_index + 1) .. ": " .. title .. " "
end)

-- カーソル
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 500

-- スクロール
config.scrollback_lines = 10000
config.enable_scroll_bar = false

-- URL自動リンク
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- キーバインド
config.keys = {
	-- ペイン分割
	{ key = "|", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "_", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- ペイン移動
	{ key = "LeftArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
	-- ペインサイズ調整
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{ key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	-- ペインを閉じる
	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	-- コピペ
	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
}

-- マウス右クリックでペースト
config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
}

-- その他
config.audible_bell = "Disabled"

return config
