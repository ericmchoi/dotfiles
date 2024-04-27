# Antidote plugin manager setup
zstyle ':antidote:bundle' file $HOME/.config/zsh_plugins.txt
[[ -d $ZSH_PLUGIN_PATH/antidote ]] || \
  git clone https://github.com/mattmc3/antidote $ZSH_PLUGIN_PATH/antidote
source $ZSH_PLUGIN_PATH/antidote/antidote.zsh
antidote load
