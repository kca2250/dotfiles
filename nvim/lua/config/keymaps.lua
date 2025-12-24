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
