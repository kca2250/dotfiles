return {
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
			{ "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
			{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
		},
		config = function()
			require("diffview").setup({
				enhanced_diff_hl = true,
				view = {
					default = {
						layout = "diff2_horizontal",
					},
				},
			})
		end,
	},
}
