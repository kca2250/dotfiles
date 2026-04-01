return {
	{
		"stevearc/overseer.nvim",
		keys = {
			{ "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run task" },
			{ "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle task list" },
		},
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 10,
			},
		},
	},
}
