# home/modules/zsh/default.nix
{ pkgs, ... }:

{
  # ZSH設定ファイルを配置
  home.file = {
    ".zshrc".source = ./.zshrc;
  };
}
