@echo off

cp *.exe C:\
move /y "C:\Program Files\Vim\_vimrc" "C:\Program Files\Vim\_vimrc.bak"
cp _vimrc "C:\Program Files\Vim"

echo "Insall completely, please set PATH environment to C:\ !!"
pause
