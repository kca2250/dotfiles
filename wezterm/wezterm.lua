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
config.initial_cols = 130 -- 横幅（文字数）
config.initial_rows = 55 -- 高さ（行数）
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
}

-- タブのフォーマット
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab.active_pane.title
	if #title > max_width - 3 then
		title = title:sub(1, max_width - 5) .. "..."
	end
	return " " .. (tab.tab_index + 1) .. ": " .. title .. " "
end)

-- その他
config.audible_bell = "Disabled"

return config
