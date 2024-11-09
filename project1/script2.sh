#!/bin/bash

# Script that creates symbolic links from the bin, config and home directory
# https://www.freecodecamp.org/news/linux-ln-how-to-create-a-symbolic-link-in-linux-example-bash-command/


# list all files in the config/tmux directory. The files inside should be config files for tmux.
list=$(ls /home/arch/2420-as2-starting-files/config/tmux)

# list all files inside the config/kak directory. The files inside should be config files for kak.
list2=$(ls /home/arch/2420-as2-starting-files/config/kak)

list3=$(ls /home/arch/2420-as2-starting-files/home)

# The for loop will get every file inside tmux directory and make a symbolic link in my current directory.
for i in $list;
do
  # The symbolic link will be named after the file with a "." added to it.
  file="."$i
  # ln -s will look in the specified location to make a symbolic link out of the file.
  # Then the link is added to my current directory.
  ln -s /home/arch/2420-as2-starting-files/config/tmux/$i $file
done


# The for loop takes every file in the kak directory and turns it into a symbolic link.
for n in $list2;
do
  # file2="."$n names the symbolic link after the original file and adds "." before the file name.
  file2="."$n
  # The file is located and a link with a modified name is added to my current directory.
  ln -s /home/arch/2420-as2-starting-files/config/kak/$n $file2
done


for x in $list3;
do
  file3="."$x
  ln -s /home/arch/2420-as2-starting-files/home/$x $file3
done
