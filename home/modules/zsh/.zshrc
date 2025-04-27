export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

# history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks

# PROMPT
autoload colors
colors
PROMPT="%{$fg[green]%}%n%(!.#.$) %{$reset_color%}"
PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"
RPROMPT="%{$fg[cyan]%}[%~]%{$reset_color%}"

# エイリアス
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -a'
alias vi='nvim'
alias vim='nvim'
alias g='git'

### nodenv
eval "$(nodenv init - zsh)"

### goenv
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"

# # PATH設定
# export PATH=$HOME/.nix-profile/bin:$PATH

# # Nix関連
# if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
#   . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
# fi

## ghqとの連携。ghqの管理化にあるリポジトリを一覧表示する。ctrl - ]にバインド。
function peco-src () {
  local selected_dir=$(ghq list -p | peco --prompt="repositories >" --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src


# ローカル設定があれば読み込む
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
