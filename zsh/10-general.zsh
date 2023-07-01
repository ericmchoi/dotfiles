TMUX_SESSION_NAME="main"
if command -v tmux &> /dev/null && [[ -n "$PS1" ]] && [[ -z "$TMUX" ]]; then
    if ! (tmux ls | grep "^${TMUX_SESSION_NAME}.*(attached)$") &> /dev/null; then
        exec tmux new -A -s $TMUX_SESSION_NAME
    fi
fi

bindkey -v
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char

alias vi=nvim
alias vim=nvim

if command -v fd &> /dev/null; then
    export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
