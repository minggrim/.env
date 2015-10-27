find  . -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.py"> cscope.files  
cscope  -bkq -i cscope.files  
ctags  -R     
