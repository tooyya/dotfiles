-- キーマッピング設定
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader キーをスペースに設定
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ノーマルモード --
-- ウィンドウ移動
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- ウィンドウのリサイズ
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- バッファ操作
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>c", ":bdelete<CR>", opts)

-- 検索結果のハイライトをクリア
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

-- インデントを保持したまま移動
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- ビジュアルモードで選択範囲を移動
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- ペースト時に選択テキストを上書きしない
keymap("v", "p", '"_dP', opts)

-- ESCキーの代替
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- neovim-nightlyの設定が有効になっていることを確認するためのキーマップ
keymap("n", "<leader>v", function()
  vim.notify("Neovim-nightly 設定が適用されています！", vim.log.levels.INFO)
end, { desc = "Check Neovim-nightly configuration" })
