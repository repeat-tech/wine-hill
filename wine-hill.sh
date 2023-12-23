#!/bin/sh 
FILE="$HOME/.wine/drive_c/users/$USER/Application Data/Brick Hill/Player.exe"

echo "wine-hill v0.1 by repeat-tech"
echo "you should have Wine (8.0.2) installed..."
sleep 5

if test -f "$FILE"; then
    echo "brick-hill client is installed, installing URI..."
else
    echo "brick-hill client is not installed, installing..."
    wget https://brkcdn.com/downloads/BrickHillSetup.exe && WINEPREFIX=$HOME/.wine wine ./BrickHillSetup.exe
fi

if test -f "./wine-hill.handler.sh"; then
    echo "handler is already installed(?), skipping..."
else
    echo "installing handler (for client and workshop accessibility in the start menu)..."
    cd ~/
    wget https://github.com/repeat-tech/wine-hill/raw/main/wine-hill.handler.sh
fi

if test -f "/usr/share/applications/bh.desktop"; then
    echo ".desktop file is already installed, skipping..."
else
    cd ~/Desktop/
    touch bh.desktop
    echo "[Desktop Entry]" >> bh.desktop
    echo "Name=Brick Hill" >> bh.desktop
    echo "Comment=https://brick-hill.com/" >> bh.desktop
    echo "Type=Application" >> bh.desktop
    echo "Exec=env $HOME/wine-hill.handler.sh '%u'" >> bh.desktop
    echo "MimeType=x-scheme-handler/brickhill.legacy" >> bh.desktop
    echo "Categories=Game;" >> bh.desktop
    sudo mv *.desktop /usr/share/applications
    sudo update-desktop-database
fi
sleep 2

echo "you did it!"
