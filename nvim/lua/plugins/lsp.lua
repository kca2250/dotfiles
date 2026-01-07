return {
	-- nvim-lspconfig: サーバー設定を提供
	{ "neovim/nvim-lspconfig" },

	-- Mason: LSPサーバー管理
	{
		"mason-org/mason.nvim",
		opts = {},
	},

	-- Mason-LSPConfig: 連携
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"pyright",
				"ts_ls",
				"html",
				"cssls",
				"lua_ls",
				"ruby_lsp",
				"tailwindcss",
			},
			automatic_enable = true,
		},
	},

	-- Mason Tool Installer: formatter/linter管理
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"black",
				"prettier",
				"stylua",
				"rubocop",
			},
		},
	},
}
