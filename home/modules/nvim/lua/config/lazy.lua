-- lazy.nvim設定ファイル
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- プラグインを設定
require("lazy").setup({
  -- カラーテーマ
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- 最初に読み込むことを保証
    config = function()
      require("plugins.catppuccin") -- 既存の設定を再利用
    end,
  },
  
  -- ステータスライン
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "catppuccin" },
    config = function()
      require("plugins.lualine") -- 既存の設定を再利用
    end,
  },
  
  -- LSP設定
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      require("plugins.lspconfig") -- 既存の設定を再利用
    end,
  },
  
  -- 補完プラグイン
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
  },
  
  -- ファイル検索
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.telescope") -- 既存の設定を再利用
    end,
  },
  
  -- シンタックスハイライト
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("plugins.treesitter") -- 既存の設定を再利用
    end,
  },
  
  -- 追加の依存関係
  { "nvim-lua/plenary.nvim" },
})
