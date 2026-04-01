return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"AndreM222/copilot-lualine",
		},
		config = function()
			require("lualine").setup({
				options = {
					theme = "onedark",
				},
				sections = {
					lualine_c = {
						{ "filename", path = 3 },
					},
					lualine_x = {
						{ "copilot", show_colors = true },
						"encoding",
						"fileformat",
						"filetype",
					},
				},
			})
		end,
	},
}
