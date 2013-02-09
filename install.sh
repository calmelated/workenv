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

git clone git@github.com:calmelated/workenv.git "$CONFIG_HOME"

cd "$CONFIG_HOME"
git submodule update --init

cd ~
#ln -sf .config/.zshrc 	 .zshrc
ln -sf .config/.bashrc    .bashrc
ln -sf .config/.screenrc  .screenrc
ln -sf .config/.tmux.conf .tmux.conf
ln -sf .config/.gitconfig .gitconfig
ln -sf .config/.gitignore .gitignore
#ln -sf .config/git_diff_wrapper git_diff_wrapper

ln -sf .config/.vim .vim
#ln -sf .config/.vim/.vimrc .vimrc
#cd "${CONFIG_HOME}/.vim"
#git submodule update --init

echo "Configuration files has been installed."

cd "$CONFIG_HOME"
