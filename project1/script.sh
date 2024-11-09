#!/bin/bash

# Script that will install packages from packages file.

# Get every new line as a package.
list=$(cat packages)

# For loop to take each entry and installed it.
for i in $list;
do
  # echo y | , this pipes y which means yes to the installation question after pacman -S $i(package name).
  # https://stackoverflow.com/questions/7642674/how-do-i-script-a-yes-response-for-installing-programs
  echo y | pacman -S $i
done
