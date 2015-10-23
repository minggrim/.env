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
	$COPY_TOOL -av --delete vim/.vim ~
	$COPY_TOOL -av --delete vim/.vimrc ~
	$COPY_TOOL -av --delete .tmux.conf ~
	$COPY_TOOL -av --delete bash/.bashrc ~
	$COPY_TOOL -av --delete bash/.bash_profile ~
	$COPY_TOOL -av --delete ssh/config ~/.ssh

else
	$COPY_TOOL vim/.vim ~
	$COPY_TOOL vim/.vimrc ~
	$COPY_TOOL .tmux.conf ~
	$COPY_TOOL bash/.bashrc ~
	$COPY_TOOL bash/.bash_profile ~
	$COPY_TOOL ssh/config ~/.ssh
fi


echo $HOME
