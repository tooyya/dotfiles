# ZSH環境変数設定ファイル

# エディタ設定
export EDITOR=nvim
export VISUAL=nvim

# XDGディレクトリ設定
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# PATH設定
typeset -U path
path=(
  $HOME/.nix-profile/bin
  /nix/var/nix/profiles/default/bin
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /usr/local/bin
  /usr/local/sbin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  $path
)

# ZDOTDIR設定
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

# Node.js
export NODE_OPTIONS=--max-old-space-size=4096

# Rust
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
