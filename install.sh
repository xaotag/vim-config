#!/bin/bash
yay -Syu curl git 
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cd ~ 
cd vim-config
mkdir ~/.config/nvim
cd ~/.config/nvim
touch init.vim
ln -s ~/.config/nvim/init.vim ~/.vimrc
rm -r  ~/vim-config


