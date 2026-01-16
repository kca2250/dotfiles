return {
	{
		"ATTron/bebop.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bebop").setup({
				transparent = true,
				terminal_colors = true,
				preset = "default", -- "default", "spike", "faye" から選べる
			})
			vim.cmd.colorscheme("bebop")
		end,
	},
}
