return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			wk.setup({
				delay = 300,
			})

			-- グループ名を登録
			wk.add({
				{ "<leader>f", group = "Find (Telescope)" },
				{ "<leader>h", group = "Git Hunk" },
				{ "<leader>c", group = "Code" },
			})
		end,
	},
}
