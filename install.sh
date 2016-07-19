#!/bin/sh
CONFIG_HOME=~/.workenv

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ "`id -u`" != "0" ] && die "This tool is root only !"
[ -e "$CONFIG_HOME" ] && die "$CONFIG_HOME already exists."

read -p "In Docker ? (y or n) " inDocker
read -p "Use NCHC sources.list ? (y or n) " useNCHC

if [ "$useNCHC" = "y" -o "$useNCHC" = "Y" ]; then 
    echo "Apply NCHC sources.list ..."
    sed -i 's/tw.archive.ubuntu.com/free.nchc.org.tw/g' /etc/apt/sources.list 
    sed -i 's/security.ubuntu.com/free.nchc.org.tw/g' /etc/apt/sources.list 
    sed -i 's/archive.ubuntu.com/free.nchc.org.tw/g' /etc/apt/sources.list 
fi

# Insall tools
apt-get update --fix-missing
apt-get install -y git htop screen tmux vim npm nodejs cscope exuberant-ctags lrzsz mysql-client \
software-properties-common python-software-properties mytop colordiff iftop curl wget iputils-ping net-tools

# Use Bash
cd /bin ; rm -f /bin/sh ; ln -sf /bin/bash sh; cd - ;

# Clear apt-get cache
apt-get autoremove -y
if [ "$inDocker" = "y" -o "$inDocker" = "Y" ]; then 
    sleep 0 # nothing
else  
    # update security patch 
    dpkg-reconfigure -plow unattended-upgrades
fi

# Lastest stable Node.js 
npm cache clean -f
npm install -g n
n stable
node -v

# Checkout environment 
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
ln -sf .workenv/jshintrc    .jshintrc
#ln -sf .workenv/git_diff_wrapper git_diff_wrapper

mkdir -p ~/vi_backup/
ln  -sf .workenv/vimrc      .vimrc
#ln -sf .workenv/.vim/.vimrc .vimrc
#cd "${CONFIG_HOME}/.vim"
#git submodule update --init
cd "$CONFIG_HOME"
rm -rf vundle
git clone https://github.com/gmarik/vundle.git

echo "Configuration files has been installed."
