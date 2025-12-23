local keymap = vim.keymap.set

-- リーダーキーをスペースに
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 保存・終了
keymap("n", "<leader>w", ":w<CR>", { desc = "Save" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- ウィンドウ移動
keymap("n", "<C-h>", "<C-w>h", { desc = "Move left" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move down" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move up" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move right" })

-- ESCでハイライト消す
keymap("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear search" })
