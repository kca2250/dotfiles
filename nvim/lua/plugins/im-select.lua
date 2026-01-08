-- 以下を実行してローカルにインストールする必要がある
-- brew tap daipeihust/tap
-- brew install im-select

return {
	"keaising/im-select.nvim",
	event = "InsertEnter",
	opts = {
		default_im_select = "com.apple.keylayout.ABC",
		default_command = "im-select",
	},
}
