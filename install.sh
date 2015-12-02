#!/bin/sh

mv ~/.vimrc vimrc.bak

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir vbackup vundo vswap vundo vinfo
cp clang-format ../.clang-format
cp ycm_extra_conf.py ../.ycm_extra_conf.py
