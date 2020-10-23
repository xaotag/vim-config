#!/bin/bash
yay -S curl git 
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
git clone https://github.com/xaotag/vim-config/
cd vim-config
./install.sh
mkdir ~/.config/nvim
touch init.yaml
ln -s ~/.config/nvim ~/.vimrc


