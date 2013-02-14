#!/bin/sh
CONFIG_HOME=~/.workenv

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "$CONFIG_HOME" ] && die "$CONFIG_HOME already exists."

git clone https://github.com/calmelated/workenv.git "$CONFIG_HOME"

cd "$CONFIG_HOME"
git submodule update --init

cd ~
#ln -sf .workenv/zshrc      .zshrc
ln -sf .workenv/bin         bin
ln -sf .workenv/bashrc      .bashrc
ln -sf .workenv/screenrc    .screenrc
ln -sf .workenv/tmux.conf   .tmux.conf
ln -sf .workenv/gitconfig   .gitconfig
ln -sf .workenv/gitignore   .gitignore
#ln -sf .workenv/git_diff_wrapper git_diff_wrapper

ln  -sf .workenv/vimrc      .vimrc
#ln -sf .workenv/.vim/.vimrc .vimrc
#cd "${CONFIG_HOME}/.vim"
#git submodule update --init
cd "$CONFIG_HOME"
rm -rf vundle
git clone https://github.com/gmarik/vundle.git

echo "Configuration files has been installed."
