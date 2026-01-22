return {
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = function()
			require("dressing").setup({
				input = {
					enabled = true,
					default_prompt = "Input:",
					win_options = {
						winblend = 0,
					},
				},
				select = {
					enabled = true,
					backend = { "telescope", "builtin" },
				},
			})
		end,
	},
}
