return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "LspAttach",
	priority = 1000,
	config = function()
		-- デフォルトの診断表示をオフに
		vim.diagnostic.config({ virtual_text = false })

		require("tiny-inline-diagnostic").setup({
			preset = "modern", -- "modern", "classic", "minimal" など
		})
	end,
}
