# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#set -o vi
#set -o emacs

# man bash
#HISTCONTROL=ignoreboth
HISTCONTROL=ignorespace # 空白的不紀錄進 history 中(security)
HISTFILESIZE=5000
HISTSIZE=5000
#HISTIGNORE='&:rm:ls:[bf]g:exit' # 不紀錄, rm, exit

# If running interactively, then:
if [ "$PS1" ]; then

    # don't put duplicate lines in the history. See bash(1) for more options
    # export HISTCONTROL=ignoredups

    # enable color support of ls and also add handy aliases
    eval `dircolors -b`
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'

    # some more ls aliases
    #alias cd="$HOME/.workenv/bin/cdecd"
    #alias make="$HOME/.workenv/bin/cdemake"
    alias ll='ls -lh --color'
    alias lr='ls -lh --color | less -r'
    alias ll='ls -lh --color'
    alias dir='ls -lh --color'
    alias la='ls -Ah'
    alias l='ls -CFh'
    alias vi='vim'
    alias d='ls */ -d'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias cgrep='grep -Hnr --include=*.{c,h} --color=auto'
    alias diff='colordiff -Naur'
    alias top='htop'
    alias route='route -n'
    alias ps='ps -ef'
    alias indent='indent -kr -st -i4 cli4 -nut'
    alias tmux='TERM=xterm-256color tmux -2'
    #alias b="echo export LANG=zh_TW.Big5;echo export LC_ALL=zh_TW.Big5"
    #alias u="echo export LANG=zh_TW.UTF-8;echo export LC_ALL=zh_TW.UTF-8"
    alias g++='g++ -Wno-deprecated'
    alias halt='sudo shutdown -h now'
    alias reboot='sudo shutdown -r now'
    alias dcreate='dpkg-buildpackage -rfakeroot -b'
    alias ssh='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
    alias tor-ssh='ssh -o ProxyCommand="nc -X 4 -x localhost:9050 %h %p"'
    alias lastloguser="lastlog -b 6"
    alias apachemon='while :; do ps -eo pid,ni,pri,pcpu,psr,comm | grep "apache"; sleep 1; done';
    alias mysqlmon='while :; do ps -eo pid,ni,pri,pcpu,psr,comm | grep "mysql"; sleep 1; done';
    alias topthreads="find /proc/*/status -exec awk '/^Pid:/ { p=\$2}; /^Name:/ { n=\$2}; /^Threads:/ { t=\$2}; END{ printf(\"%6d %-30s %5d\n\", p, n, t);}' {} \; | sort -k3 -g -r | head -10"
    alias ..='cd ..'
    alias ...='cd ../..'
    alias ....='cd ../../..'
    alias .....='cd ../../../..'
    alias .....='cd ../../../../..'
    alias cd..='cd ..'
    alias cd...='cd ../..'
    alias cd....='cd ../../..'
    alias cd.....='cd ../../../..'
    alias cd.....='cd ../../../../..'

    # set a fancy prompt
    PS1='\u@\h:\w\$ '
    # PS1='\[\u@\h:\e[32m\w\e[0m$ \]'

    # If this is an xterm set the title to user@host:dir
    case $TERM in
    xterm*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
        ;;
    *)
        ;;
    esac

    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc).
    if [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
    fi
fi

# 靜音, 設定關閉PC喇叭的bell..bell..聲
set nobeep
# xwindow 要用這個關
#xset b off
setterm -blength 0

export PATH=$HOME/bin:$PATH
#export LANG=zh_TW.UTF-8
#export LC_ALL=zh_TW.UTF-8
export EDITOR=vim
export SVN_EDITOR=vim
export GREP_OPTIONS="--exclude=.svn --exclude=.git"

# 設 less
#export LC_CTYPE=it_CH.ISO_8859-1

export MYSQL_PS1="(\u@\h) [\d]> "

#改 di=01;36(01;33), ln=02;36(01;36)
declare -x LS_COLORS="no=00:fi=00:di=01;36:ln=02;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:"

# For colourful man pages (CLUG-Wiki style)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# git branch
function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}")";
}
#PS1="[\[\033[1;32m\]\w\[\033[0m] \[\033[0m\]\[\033[1;36m\]\$(git_branch)\[\033[0m\]$ "
#PS1=$PS1"\$(git_branch)"
#PS1="\u@\h:\w\$(git_branch)\$ "
PS1="\[\033[1;33m\]\u\[\033[1;37m\]@\[\033[1;32m\]\h\[\033[1;37m\]:\[\033[1;31m\]\w\$(git_branch)\[\033[1;36m\]\$ \[\033[0m\]"
