#!/bin/sh
#This is a script to build a convience enviroment
cd $(pwd)
RSYNC=$(which rsync)

if [ $? -eq 0 ] 
then
	COPY_TOOL=$RSYNC
	RSYNC="Y"
else 
	COPY_TOOL=$(which cp)
	RSYNC="N"
fi

echo "using $COPY_TOOL to copy files"
if [ "$RSYNC" = "Y" ]
then
	$COPY_TOOL -av --delete bin ~
	$COPY_TOOL -av --delete util_scripts ~
	$COPY_TOOL -av --delete vim/colors ~/.vim
else
	$COPY_TOOL bin ~
	$COPY_TOOL util_scripts ~
	$COPY_TOOL vim/colors ~/.vim
fi

ln -sf `pwd`/vim/.vimrc ~/.vimrc
ln -sf `pwd`/tmux/.tmux.conf ~/.tmux.conf
ln -sf `pwd`/bash/.bashrc ~/.bashrc
ln -sf `pwd`/bash/.bash_profile ~/.bash_profile
ln -sf `pwd`/bash/.inputrc ~/.inputrc
ln -sf `pwd`/ssh/config ~/.ssh

uname -a | grep -i "ubuntu" > /dev/null
if [ $? -eq 0 ]
then
    sudo apt-get update
    sudo apt-get install -y -q python-pip python-dev build-essential 
    sudo pip install --upgrade pip 
    sudo pip install --upgrade virtualenv 
    sudo apt-get install -y -q vim
    sudo apt-get install -y -q git
    sudo apt-get install -y -q tig
    sudo apt-get install -y -q exuberant-ctags
    sudo apt-get install -y -q cscope
else
    echo "other linux distrubution"
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall
############################
#  install python packages #
############################
sudo pip install flake8

cd ~

export PATH=`pwd`/bin:`pwd`/util_scripts:$PATH
