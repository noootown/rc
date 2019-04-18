cd $HOME
git clone https://github.com/noootown/rc

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
cd $HOME/rc/script
brew bundle

./linkDotfile.sh

cd $HOME
# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k

# install powerline fonts
git clone https://github.com/powerline/fonts
cd fonts
./install.sh
cd ..
rm -rf fonts

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install ws
ln -s $ZSH_CONFIG_ROOT/ws ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/ws

# emoji-cli
git clone https://github.com/b4b4r07/emoji-cli
source ./emoji-cli/emoji-cli.zsh
rm -rf emoji-cli

# install vundle and vim plugin
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

defaults write -g ApplePressAndHoldEnabled -bool false
