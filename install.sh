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
	$COPY_TOOL -av --delete bin ~
	$COPY_TOOL -av --delete util_scripts ~
else
	$COPY_TOOL vim/.vim ~
	$COPY_TOOL vim/.vimrc ~
	$COPY_TOOL .tmux.conf ~
	$COPY_TOOL bash/.bashrc ~
	$COPY_TOOL bash/.bash_profile ~
	$COPY_TOOL ssh/config ~/.ssh
	$COPY_TOOL bin ~
	$COPY_TOOL util_scripts ~
fi


read -p "want to compile ctags and cscope from source? (yes/no)" ifcts
while [ "$ifcts" != "yes" -a "$ifcts" != "YES" -a "$ifcts" != "no" -a "$ifcts" != "NO" ] 
do
	read -p "unkown input, please input yes or no :" ifcts
done

if [ "$ifcts" = "yes" -o "$ifcts" = "YES" ]; then
	cd sources
	rm -rf ctags-5.8
	tar xzf ctags-5.8.tar.gz
	cd ctags-5.8
	./configure --prefix=$HOME/bin/ctags
	make && make install
	if [ $? -eq 0 ]; then
		echo "compile and install ctags successfully in $HOME/bin/ctags";
		cd ..
		rm -rf ctags-5.8
	else
		echo "fail to install ctags from source"	
		cd ..
	fi
	
	rm -rf cscope-15.8b
	tar xzf cscope-15.8b.tar.gz
	cd cscope-15.8b
	./configure --prefix=$HOME/bin/cscope
	make && make install
	if [ $? -eq 0 ]; then
		echo "compile and install cscope successfully in $HOME/bin/cscope";
		cd ..
		rm -rf cscope-15.8b
	else
		echo "fail to install cscope from source"	
		cd ..
	fi
	
fi
echo $ifcts
echo $HOME
exec bash
