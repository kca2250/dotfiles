return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		-- 見出し：レベルごとに色分け、アイコンはあり派
		heading = {
			icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
			border = true,
		},

		-- 箇条書き：ネストで変化して楽しい
		bullet = {
			icons = { "◉", "○", "✸", "✿" },
		},

		-- チェックボックス：状態が一目でわかる
		checkbox = {
			unchecked = { icon = "󰄱 ", highlight = "RenderMarkdownUnchecked" },
			checked = { icon = "󰄵 ", highlight = "RenderMarkdownChecked" },
			custom = {
				todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
				canceled = { raw = "[~]", rendered = "󰜺 ", highlight = "RenderMarkdownError" },
				important = { raw = "[!]", rendered = "󰀦 ", highlight = "RenderMarkdownWarn" },
			},
		},

		-- コードブロック：しっかり目立たせる
		code = {
			sign = true,
			width = "block",
			border = "thick",
			language_pad = 1,
		},

		-- リンク：種類でアイコン変える
		link = {
			hyperlink = "󰌷 ",
			conceal = true,
		},

		-- 引用：左にライン＋アイコン
		quote = {
			icon = "┃",
		},

		-- 水平線
		dash = {
			icon = "─",
		},

		-- コールアウト（NOTE, WARNINGなど）
		callout = {
			note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
			tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
			warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
			caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
		},
	},
}
