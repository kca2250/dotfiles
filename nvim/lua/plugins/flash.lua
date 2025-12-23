return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		keys = {
			{
				"s",
				function()
					require("flash").jump()
				end,
				desc = "Flash jump",
			},
			{
				"S",
				function()
					require("flash").treesitter()
				end,
				desc = "Flash treesitter",
			},
		},
		config = function()
			require("flash").setup()
		end,
	},
}
