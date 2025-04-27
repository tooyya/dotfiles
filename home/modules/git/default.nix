# home/modules/git/default.nix
{ pkgs, ... }:

{
  # Gitをインストール
  home.packages = with pkgs; [
    git
    git-lfs
  ];

  # 設定ファイルを配置
  home.file = {
    # ~/.gitconfigを配置
    ".gitconfig".source = ./config/gitconfig;

    # ~/.gitignore_globalを配置
    ".gitignore_global".source = ./config/gitignore_global;
  };
}
