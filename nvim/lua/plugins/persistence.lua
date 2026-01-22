return {
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		config = function()
			require("persistence").setup({
				dir = vim.fn.stdpath("state") .. "/sessions/",
				need = 1,
				branch = true,
			})
		end,
		keys = {
			{
				"<leader>qs",
				function()
					require("persistence").load()
				end,
				desc = "Restore Session",
			},
			{
				"<leader>ql",
				function()
					require("persistence").load({ last = true })
				end,
				desc = "Restore Last Session",
			},
			{
				"<leader>qd",
				function()
					require("persistence").stop()
				end,
				desc = "Don't Save Current Session",
			},
		},
	},
}
