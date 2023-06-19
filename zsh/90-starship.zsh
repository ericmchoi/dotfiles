# Starship prompt setup
mkdir -p $ZSH_PLUGIN_PATH/starship
path+=$ZSH_PLUGIN_PATH/starship
command -v starship &> /dev/null || \
  curl -sS https://starship.rs/install.sh | sh -s -- -y -b $ZSH_PLUGIN_PATH/starship
eval "$(starship init zsh)"
