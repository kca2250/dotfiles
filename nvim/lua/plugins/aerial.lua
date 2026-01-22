return {
	{
		"stevearc/aerial.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>co", "<cmd>AerialToggle!<cr>", desc = "Toggle Outline" },
			{ "<leader>cn", "<cmd>AerialNavToggle<cr>", desc = "Toggle Aerial Nav" },
		},
		config = function()
			require("aerial").setup({
				backends = { "treesitter", "lsp", "markdown", "man" },
				layout = {
					min_width = 30,
					default_direction = "right",
				},
				show_guides = true,
				filter_kind = false,
			})
		end,
	},
}
