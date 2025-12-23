return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				current_line_blame = false,
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns
					local keymap = vim.keymap.set

					-- ナビゲーション
					keymap("n", "]h", gs.next_hunk, { buffer = bufnr, desc = "Next hunk" })
					keymap("n", "[h", gs.prev_hunk, { buffer = bufnr, desc = "Prev hunk" })

					-- アクション
					keymap("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
					keymap("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
					keymap("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
					keymap("n", "<leader>hb", gs.blame_line, { buffer = bufnr, desc = "Blame line" })
				end,
			})
		end,
	},
}
