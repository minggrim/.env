alias ls="ls -GF"
alias ll="ls -GFalh"
LS_COLORS='di=93:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export LS_COLORS
PATH=~/bin:~/util_scripts:$PATH
export PATH
LD_LIBRARY_PATH=~/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# PS1="\e[0;33m\u\e[0m@\h\e[0;33m\$(pwd)\e[0m:\$(date +%k:%M:%S) $ "
PS1='\[\e[0;33m\]\u\[\e[0m\]@\h:\[\e[0;34m\]\w\[\e[0m\][$(date +%k:%M:%S)]\$ '
