alias vi=nvim
alias vim=nvim

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

setopt PROMPT_SUBST
PROMPT='%M:%F{blue}%~%f%F{yellow}$(parse_git_branch)%f'$'\n''$ ';

if command -v fd &> /dev/null; then
    export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
