#!/bin/bash
# author:win7

vim_config() {
    ln -s ~/dotfiles/.vimrc ~/.vimrc
}

vim_plug_install() {
  echo "install vim plug."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

echo "------start installation-----"
vim_config
vim_plug_install
echo "------finish installation----"
