#!/bin/bash

if [[ "$1" == *"brickhill.legacy://client/"* ]]; then
    touch logs.txt
    echo "$1" >> logs.txt
    client=$(echo "$1" | sed 's|brickhill.legacy://client/||')
    echo "$client"
    WINEPREFIX=$HOME/.wine wine "$HOME/.wine/drive_c/users/$USER/Application Data/Brick Hill/Player.exe" "$client"
else
    echo "no arguments, opening workshop..."
    WINEPREFIX=$HOME/.wine wine "$HOME/.wine/drive_c/users/$USER/Application Data/Brick Hill/Workshop.exe"
fi
