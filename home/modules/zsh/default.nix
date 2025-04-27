# home/modules/zsh/default.nix
{ pkgs, ... }:

{
  # ZSH本体をインストール
  home.packages = with pkgs; [
    zsh
  ];

  # ZSH設定ファイルを配置
  home.file = {
    # ~/.zshenvを配置
    ".zshenv".source = ./.zshenv;
  };

  # XDG設定ディレクトリにZSH設定を配置
  xdg.configFile = {
    # ~/.config/zsh/.zshrcを配置
    "zsh/.zshrc".source = ./.zshrc;

    # 必要に応じて追加の設定ファイルもここに配置可能
    # "zsh/aliases.zsh".source = ./aliases.zsh;
    # "zsh/functions".source = ./functions;
  };

  # プログラムの有効化だけを行い、設定はファイル配置に任せる
  programs.zsh.enable = true;
}
