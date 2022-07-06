eval $(/opt/homebrew/bin/brew shellenv)

# 補完機能
autoload -U compinit
compinit

# prompt
PROMPT='%m:%c %n$ '

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000

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

setopt hist_ignore_dups     # ignore duplication command history list
setopt no_share_history

# tmux起動
tmux
