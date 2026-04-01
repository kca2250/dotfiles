return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		"zbirenbaum/copilot.lua",
		"nvim-lua/plenary.nvim",
	},
	cmd = {
		"CopilotChat",
		"CopilotChatOpen",
		"CopilotChatToggle",
		"CopilotChatExplain",
		"CopilotChatReview",
		"CopilotChatFix",
		"CopilotChatOptimize",
		"CopilotChatDocs",
		"CopilotChatTests",
		"CopilotChatCommit",
	},
	keys = {
		{ "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
		{ "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = { "n", "v" }, desc = "CopilotChat - Explain" },
		{ "<leader>cr", "<cmd>CopilotChatReview<cr>", mode = { "n", "v" }, desc = "CopilotChat - Review" },
		{ "<leader>cf", "<cmd>CopilotChatFix<cr>", mode = { "n", "v" }, desc = "CopilotChat - Fix" },
		{ "<leader>co", "<cmd>CopilotChatOptimize<cr>", mode = { "n", "v" }, desc = "CopilotChat - Optimize" },
		{ "<leader>cd", "<cmd>CopilotChatDocs<cr>", mode = { "n", "v" }, desc = "CopilotChat - Docs" },
		{ "<leader>ct", "<cmd>CopilotChatTests<cr>", mode = { "n", "v" }, desc = "CopilotChat - Tests" },
	},
	opts = {},
}
