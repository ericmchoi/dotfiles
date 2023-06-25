if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux new-session -A -s main
fi

bindkey -v
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char

alias vi=nvim
alias vim=nvim
