#!/bin/bash
# i think this is the right one idk anymore

FILE="$HOME/.wine/drive_c/users/$USER/Application Data/Brick Hill/Player.exe"

Uri () 
{
    if test -f "$FILE"; then
        echo "brick-hill client is installed, installing URI..."
    else
        echo "brick-hill client is not installed, installing..."
        wget https://brkcdn.com/downloads/BrickHillSetup.exe && WINEPREFIX=$HOME/.wine wine ./BrickHillSetup.exe
    fi
}

if [[ "$1" == "--gamma"  ]] || [[ "$1" == "-g"  ]]; then
    echo "installing gamma client..."
    if test -f "$FILE"; then
        Gammainstall() 
        {
        cd "$HOME/.wine/drive_c/users/$USER/Application Data/Brick Hill/"
        sudo rm ./Player.exe
        wget "https://github.com/jbfodevstyle/Gamma/raw/main/Player.exe" && echo "gamma client is installed!"
        }
        Gammainstall
    else
        Uri
    fi
else
    echo "wine-hill v0.2 by repeat-tech"
    echo "you should already have wine installed..."
    sleep 2
fi


Handler ()
{
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
        echo "Exec=$HOME/wine-hill.handler.sh '%u'" >> bh.desktop
        echo "MimeType=x-scheme-handler/brickhill.legacy" >> bh.desktop
        echo "Categories=Game;" >> bh.desktop
        sudo mv *.desktop /usr/share/applications
        sudo update-desktop-database
    fi
    sleep 2
}

echo "you did it!"
