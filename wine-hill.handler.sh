if [ "$1" ]; then
    WINEPREFIX=$HOME/.wine wine $HOME/.wine/drive_c/users/$USER/Application\ Data/Brick\ Hill/Player.exe $1
else
    echo "no arguments, opening workshop..."
    WINEPREFIX=$HOME/.wine wine $HOME/.wine/drive_c/users/$USER/Application\ Data/Brick\ Hill/Workshop.exe
fi
