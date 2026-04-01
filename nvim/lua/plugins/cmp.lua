return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"giuxtaposition/blink-cmp-copilot",
	},
	opts = {
		keymap = {
			preset = "enter",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "copilot" },
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
				},
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
