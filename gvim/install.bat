@echo off

cp *.exe C:\
mv "C:\Program Files\Vim\_vimrc" "C:\Program Files\Vim\_vimrc.bak"
cp _vimrc "C:\Program Files\Vim"

echo ""
echo ""
echo "Insall completely, please set PATH environment to C:\ !!"
echo ""
echo ""
pause
