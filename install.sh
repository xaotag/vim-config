#!/bin/bash
yay -Syu curl git 
cd ~ 
git clone https://github.com/xaotag/vim-config
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cd vim-config
mkdir -p ~/.config/nvim
cp ./init.vim ~/.config/nvim
