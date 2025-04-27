-- treesitterの設定
require('nvim-treesitter.configs').setup {
  -- ハイライトを有効化
  highlight = {
    enable = true,
  },
  -- インデントを有効化
  indent = {
    enable = true,
  },
  -- 自動ペアを有効化
  autopairs = {
    enable = true,
  },
  -- コンテキスト認識コメントを有効化
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  -- 選択機能を有効化
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = "<C-s>",
      node_decremental = "<M-space>",
    },
  },
}
