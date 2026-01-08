local opt = vim.opt
-- nvim環境下ではマウス禁止
opt.mouse = ""

--　タイトル編集
opt.title = true
opt.titlestring = "nvim: [ %{fnamemodify(getcwd(), ':t')} ]"

-- 行番号
opt.number = true
opt.relativenumber = false

-- インデント
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- 検索
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- 見た目
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true

-- ファイル
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- その他
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.splitright = true
opt.splitbelow = true

-- 折りたたみ設定
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99 -- 起動時は全部開いた状態
