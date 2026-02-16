return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			wk.setup({
				delay = 300,
			})

			wk.add({
				-- Leader グループ
				{ "<leader>f", group = "Find (Telescope)" },
				{ "<leader>h", group = "Git Hunk / Harpoon" },
				{ "<leader>c", group = "Code" },
				{ "<leader>d", group = "Debug" },
				{ "<leader>x", group = "Trouble" },
				{ "<leader>a", group = "AI/Claude" },
				{ "<leader>s", group = "Split" },
				{ "<leader>g", group = "Git" },
				{ "<leader>q", group = "Session" },

				-- LSP (g)
				{ "g", group = "Go to / LSP" },
				{ "gd", desc = "Definition" },
				{ "gD", desc = "Declaration" },
				{ "grr", desc = "References" },
				{ "gri", desc = "Implementation" },
				{ "grn", desc = "Rename" },
				{ "gra", desc = "Code Action" },
				{ "gg", desc = "First line" },
				{ "G", desc = "Last line" },
				{ "gf", desc = "Go to file under cursor" },
				{ "gx", desc = "Open URL under cursor" },

				-- Hover
				{ "K", desc = "Hover / Man page" },

				-- 診断・ジャンプ
				{ "[", group = "Prev" },
				{ "[d", desc = "Prev Diagnostic" },
				{ "[h", desc = "Prev Hunk" },
				{ "[[", desc = "Prev section" },
				{ "[{", desc = "Prev {" },
				{ "[(", desc = "Prev (" },

				{ "]", group = "Next" },
				{ "]d", desc = "Next Diagnostic" },
				{ "]h", desc = "Next Hunk" },
				{ "]]", desc = "Next section" },
				{ "]}", desc = "Next }" },
				{ "])", desc = "Next )" },

				-- 折りたたみ (z)
				{ "z", group = "Fold / Scroll" },
				{ "za", desc = "Toggle fold" },
				{ "zc", desc = "Close fold" },
				{ "zo", desc = "Open fold" },
				{ "zM", desc = "Close all folds" },
				{ "zR", desc = "Open all folds" },
				{ "zz", desc = "Center cursor" },
				{ "zt", desc = "Cursor to top" },
				{ "zb", desc = "Cursor to bottom" },

				-- ウィンドウ (Ctrl+w)
				{ "<C-w>", group = "Window" },
				{ "<C-w>s", desc = "Split horizontal" },
				{ "<C-w>v", desc = "Split vertical" },
				{ "<C-w>c", desc = "Close window" },
				{ "<C-w>o", desc = "Close other windows" },
				{ "<C-w>=", desc = "Equal size" },
				{ "<C-w>h", desc = "Go left" },
				{ "<C-w>j", desc = "Go down" },
				{ "<C-w>k", desc = "Go up" },
				{ "<C-w>l", desc = "Go right" },

				-- マーク (m / ')
				{ "m", group = "Set mark" },
				{ "'", group = "Go to mark" },

				-- レジスタ / マクロ
				{ '"', group = "Registers" },
				{ "q", desc = "Record macro" },
				{ "@", group = "Play macro" },

				-- 検索
				{ "/", desc = "Search forward" },
				{ "?", desc = "Search backward" },
				{ "n", desc = "Next match" },
				{ "N", desc = "Prev match" },
				{ "*", desc = "Search word under cursor" },
				{ "#", desc = "Search word backward" },

				-- ビジュアルモード
				{ "v", desc = "Visual mode" },
				{ "V", desc = "Visual line mode" },
				{ "<C-v>", desc = "Visual block mode" },

				-- テキストオブジェクト
				{ "i", group = "Inner (text object)", mode = { "o", "v" } },
				{ "a", group = "Around (text object)", mode = { "o", "v" } },
			})
		end,
	},
}
