return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = {
					"lua",
					"javascript",
					"typescript",
					"html",
					"css",
					"json",
					"yaml",
					"bash",
					"markdown",
					"go",
					"gomod",
					"gosum",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
