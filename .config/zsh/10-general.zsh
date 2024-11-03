alias vi=nvim
alias vim=nvim

alias ll='ls -la'

reset_mac_dock() {
    defaults write com.apple.dock tilesize -int 32
    defaults write com.apple.dock size-immutable -bool yes
    defaults write com.apple.dock orientation left
    killall Dock
}

set_theme() {
    echo "return \"$1\"" > $HOME/.config/theme.lua
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

setopt PROMPT_SUBST
PROMPT='%M:%F{blue}%~%f%F{yellow}$(parse_git_branch)%f'$'\n''$ ';

if command -v fd &> /dev/null; then
    export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# zsh-vi-mode fzf compatibility fix
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')
