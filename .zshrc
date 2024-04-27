export CLICOLOR=1
export EDITOR=nvim

ZSH_PLUGIN_PATH=$HOME/.cache/zsh

for file in $HOME/.config/zsh/<->-*.zsh(nN); do
  source $file
done
