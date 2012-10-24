#!/bin/sh

mkdir $1
cd $1
echo "--"$1": A LOVE2D game by Christopher Sturgess\n\n\nfunction love.load()\n\n\n\n\nend\n\n\nfunction love.update()\n\n\n\n\nend\n\n\nfunction love.draw()\n\n\n\n\nend\n\n" > main.lua
mkdir Resources
cd Resources
mkdir Images
mkdir Audio
mkdir Fonts
cd ..
mkdir Modules
echo "#"$1 > README.md
cd ..
