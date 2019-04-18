# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=13

export ZSH_CONFIG_ROOT=$HOME/rc/shell/bin
source $ZSH_CONFIG_ROOT/theme.zsh
source $ZSH_CONFIG_ROOT/plugin.zsh

source $ZSH/oh-my-zsh.sh
# for command completion
compinit

source $ZSH_CONFIG_ROOT/path.zsh
source $ZSH_CONFIG_ROOT/alias.zsh
source $ZSH_CONFIG_ROOT/docker.zsh
source $ZSH_CONFIG_ROOT/git.zsh
source $ZSH_CONFIG_ROOT/nvm.zsh
source $ZSH_CONFIG_ROOT/other.zsh
source $ZSH_CONFIG_ROOT/welcome.zsh
