#!/bin/sh

mv ~/.vimrc vimrc.bak
mv ~/.clang-format clang-format.bak
mv ~/.ycm_extra_conf.py ycm_extra_conf.py.bak

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir vbackup vswap vundo vinfo
cp clang-format ~/.clang-format
cp ycm_extra_conf.py ~/.ycm_extra_conf.py
