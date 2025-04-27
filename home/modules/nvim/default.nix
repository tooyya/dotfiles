# home/modules/nvim/default.nix
{ pkgs, ... }:

{
  # Neovimをインストール
  home.packages = with pkgs; [
    # Neovim本体（overlayにより自動的にnightly版になる）
    neovim
  ];

  # Neovimの設定
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    # プラグインの追加
    plugins = with pkgs.vimPlugins; [
      # lazy.nvim本体
      lazy-nvim

      # lazy.luaで使用されている各プラグイン
      catppuccin-nvim
      lualine-nvim
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      telescope-nvim
      plenary-nvim
      nvim-treesitter
    ];
  };

  # 設定ファイルをシンボリックリンクとして配置
  xdg.configFile = {
    # 基本設定ファイル
    "nvim/init.lua".source = ./init.lua;
    "nvim/lua/config/options.lua".source = ./lua/config/options.lua;
    "nvim/lua/config/keymaps.lua".source = ./lua/config/keymaps.lua;

    # lazy.nvim用の設定
    "nvim/lua/config/lazy.lua".source = ./lua/config/lazy.lua;

    # プラグイン設定ファイル
    "nvim/lua/plugins/catppuccin.lua".source = ./plugins/catppuccin.lua;
    "nvim/lua/plugins/lualine.lua".source = ./plugins/lualine.lua;
    "nvim/lua/plugins/lspconfig.lua".source = ./plugins/lspconfig.lua;
    "nvim/lua/plugins/telescope.lua".source = ./plugins/telescope.lua;
    "nvim/lua/plugins/treesitter.lua".source = ./plugins/treesitter.lua;
  };
}
