PS1='\[\e[0;32m\]\u\[\e[m\]@\h\[\e[1;34m\]:\w\[\e[m\]\[\e[1;32m\] \$ \[\e[m\]\[\e[1;37m\]'
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
