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
	$COPY_TOOL -av --delete vim/colors ~/.vim
else
	$COPY_TOOL vim/.vim ~
	$COPY_TOOL vim/.vimrc ~
	$COPY_TOOL .tmux.conf ~
	$COPY_TOOL bash/.bashrc ~
	$COPY_TOOL bash/.bash_profile ~
	$COPY_TOOL ssh/config ~/.ssh
	$COPY_TOOL bin ~
	$COPY_TOOL util_scripts ~
	$COPY_TOOL vim/colors ~/.vim
	
fi


read -p "want to compile vim, ctags and cscope from source? (yes/no)" ifcts
while [ "$ifcts" != "yes" -a "$ifcts" != "YES" -a "$ifcts" != "no" -a "$ifcts" != "NO" ] 
do
	read -p "unkown input, please input yes or no :" ifcts
done

check_path() {
	echo "$PATH" | grep "$HOME/bin/$check/bin" 
	if [ $? -eq 0 ]; then
		result="true"
	else
		result="false"
	fi

}

if [ "$ifcts" = "yes" -o "$ifcts" = "YES" ]; then
	cd sources
	rm -rf ctags-5.8
	tar xzf ctags-5.8.tar.gz
	cd ctags-5.8
	./configure --prefix=$HOME/bin/ctags && make && make install
	if [ $? -eq 0 ]; then
		echo "compile and install ctags successfully in $HOME/bin/ctags"
		ctags="true"
		cd ..
		rm -rf ctags-5.8
	else
		echo "fail to install ctags from source"	
		cd ..
	fi
	
	rm -rf cscope-15.8b
	tar xzf cscope-15.8b.tar.gz
	cd cscope-15.8b
	./configure --prefix=$HOME/bin/cscope --with-features=huge && make && make install
	if [ $? -eq 0 ]; then
		echo "compile and install cscope successfully in $HOME/bin/cscope"
		cscope="true"
		cd ..
		rm -rf cscope-15.8b
	else
		echo "fail to install cscope from source"	
		cd ..
	fi
	
	rm -rf vim74
	tar jxf vim-7.4.tar.bz2
	cd vim74
	make distclean
	./configure --prefix=$HOME/bin/vim --with-features=huge --enable-cscope && make && make install
	if [ $? -eq 0 ]; then
		echo "compile and install vim successfully in $HOME/bin/vim"
		vim="true"
		cd ..
		rm -rf vim74
	else
		echo "fail to install vim from source"	
		cd ..
	fi
	

fi
cd ..

echo "Result report : vim:$vim cscope:$cscope ctags:$ctags"
#export PATH=$HOME/bin/ctags/bin:$HOME/bin/cscope/bin:$HOME/bin/vim/bin:$PATH
echo "changing environment PATH"

if [ "$vim" = "true" ]; then
	check="vim"
	check_path
	if [ "$result" = "false" ]; then
		PATH=$HOME/bin/vim/bin:$PATH
	fi
fi

if [ "$cscope" = "true" ]; then
	check="cscope"
	check_path
	if [ "$result" = "false" ]; then
		PATH=$HOME/bin/cscope/bin:$PATH
	fi
fi

if [ "$ctags" = "true" ]; then
	check="ctags"
	check_path
	if [ "$result" = "false" ]; then
		PATH=$HOME/bin/ctags/bin:$PATH
	fi
fi

export PATH
	


