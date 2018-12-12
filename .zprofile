# 補完機能
autoload -U compinit
compinit

# prompt
PROMPT='%m:%c %n$ '

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
#setopt share_history       # share command history data
setopt no_share_history

# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

alias ls='ls -G'
alias ll='ls -hl'


if [ -f ~/.workrc ]; then
        . ~/.workrc
fi

# pyenv関連
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(pyenv virtualenv-init -)"

# tmux起動
tmux
