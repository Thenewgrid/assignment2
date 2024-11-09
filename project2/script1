#!/bin/bash

# Script that will make a new user.
# https://www.geeksforgeeks.org/manually-add-a-user-without-tools-like-useradd-and-adduser-in-linux/

make_user () {
  # Specified shell.
  shell="/bin/bash"

  echo ""
  read -p "Which name do you want to use " name

  echo ""
  #read -p "What will be your password? " password
  
  echo ""
  read -p "Which user id would you like? E.g 1000,1001..." uid
  # Check if the user exists.
  # https://www.baeldung.com/linux/user-exists-check
  # cat /etc/passwd | grep $name

  # Home directory.
  #mkdir -p /home/$name

  # copy the contents of the /etc/skel directory into the home directory.
  #cp --recursive /etc/skel /home/$name

  # add them to a primary group that matches there user name.
  
  # grep -q "$uid" /etc/passwd && echo "taken bucko" || echo "fine"

  # https://collectingwisdom.com/bash-check-if-file-contains-string/
  if grep ":$uid:" /etc/passwd; then
    echo "Error: UID $uid is already in use." 
    exit 1
  else
    echo "UID $uid is available for use."
  fi

  #echo "$name:x:1001" >> /etc/group

  # new user should have password. use passwd.


  # Finish collecting informtaion, put it all together.

}

# Check if the script is being run as root.
# https://askubuntu.com/questions/15853/how-can-a-script-check-if-its-being-run-as-root
if [[ $EUID -ne 0 ]]; then
  echo "The script must be run with root privileges."
  # Return exit status 1 to show that the script was not run with root privileges.
  exit 1
else
  # Calling the make_user function to start the program.
  make_user
fi
