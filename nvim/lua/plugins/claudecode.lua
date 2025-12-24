return {
	{
		"coder/claudecode.nvim",
		config = function()
			require("claudecode").setup({
				window = {
					position = "vertical", -- vertical / horizontal / float
					width = 0.4, -- 40%の幅
				},
			})

			-- ClaudeCode内でのキーマップ
			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "*",
				callback = function()
					local opts = { buffer = 0 }
					vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
					vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
					vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
					vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
					vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
				end,
			})
		end,
		keys = {
			{ "<leader>a", nil, desc = "AI/Claude Code" },
			{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
		},
	},
}
