local keymap = vim.keymap.set

-- リーダーキーをスペースに
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- マウススクロールも無効化
vim.keymap.set({ "n", "i", "v" }, "<ScrollWheelUp>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<ScrollWheelDown>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<ScrollWheelLeft>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<ScrollWheelRight>", "<Nop>")

-- 保存・終了
keymap("n", "<leader>w", ":w<CR>", { desc = "Save" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- ウィンドウ移動
keymap("n", "<C-h>", "<C-w>h", { desc = "Move left" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move down" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move up" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move right" })

-- エラー詳細を表示
keymap("n", "gl", vim.diagnostic.open_float, { desc = "エラー詳細を表示" })

-- ESCでハイライト消す
keymap("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear search" })

-- jk で Esc（インサートモード）
keymap("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- ターミナルモードでも
keymap("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- ウィンドウサイズ調整
keymap("n", "<A-Up>", ":resize +2<CR>", { desc = "Height +2" })
keymap("n", "<A-Down>", ":resize -2<CR>", { desc = "Height -2" })
keymap("n", "<A-Left>", ":vertical resize -2<CR>", { desc = "Width -2" })
keymap("n", "<A-Right>", ":vertical resize +2<CR>", { desc = "Width +2" })

-- ウィンドウ分割
keymap("n", "<leader>sv", ":vs<CR>", { desc = "Split vertical" })
keymap("n", "<leader>sh", ":sp<CR>", { desc = "Split horizontal" })
keymap("n", "<leader>sx", ":close<CR>", { desc = "Close split" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Equal size splits" })

-- ノーマルモード：Alt + j/k で行移動
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- ビジュアルモード：選択範囲を移動
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- LSPの自動Code Action
keymap("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, { desc = "Code Action" })
