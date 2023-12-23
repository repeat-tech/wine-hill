if [[ "$1" == *"client"* ]]; then
    client=$(echo "$1" | sed 's/client\///')
    echo "$client"
    WINEPREFIX=$HOME/.wine wine $HOME/.wine/drive_c/users/$USER/Application\ Data/Brick\ Hill/Player.exe "$client"
else
    echo "no arguments, opening workshop..."
    WINEPREFIX=$HOME/.wine wine $HOME/.wine/drive_c/users/$USER/Application\ Data/Brick\ Hill/Workshop.exe
fi
