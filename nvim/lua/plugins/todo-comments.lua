return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		cmd = { "TodoTelescope" },
		config = function()
			require("todo-comments").setup()
		end,
	},
}
