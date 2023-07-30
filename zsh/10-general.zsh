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
