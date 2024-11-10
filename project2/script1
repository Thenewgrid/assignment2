#!/bin/bash

# Script that will make a new user.
# https://www.geeksforgeeks.org/manually-add-a-user-without-tools-like-useradd-and-adduser-in-linux/

make_user () {
  # Specified shell.
  shell="/bin/bash"

  echo ""
  # Getting the username
  read -p "Choose your username; " name
  
  # Check if the username exists.
  # https://www.baeldung.com/linux/user-exists-check
  if grep -q "$name:" /etc/passwd;then
    echo "Username, '$name' is in use."
    make_user
  else
    echo "Complete"
  fi
  
  # Getting the password 
  echo ""
  read -p "Choose your password; " password
  echo "Complete"

  # Getting user ID
  echo ""
  read -p "Which user id would you like? E.g 1000,1001..." uid
  
  # https://collectingwisdom.com/bash-check-if-file-contains-string/
  # Check if user ID exists.
  if grep -q ":$uid:" /etc/passwd; then
    echo "UserID, '$uid' is in use."
    make_user
  else
    echo "Complete"
  fi

  # Home directory.
  mkdir -p /home/$name

  # copy the contents of the /etc/skel directory into the home directory.
  cp --recursive /etc/skel /home/$name
  
  # Add user to a primary group that matches their name and user ID.
  echo "$name:x:$uid:" >> /etc/group

  # Finish collecting informtaion, put it all together.
  # Template
  # arch:x:1000:1000:arch Cloud User:/home/arch:/bin/bash
  
  echo "$name:x:$uid:$uid:Regular added user hk:/home/$name:$shell" >> /etc/passwd
  
  # Setting the password for the user.
  passwd $name

  # change ownership so that the new user owns their stuff.
  chown -R "$name:$name" /home/$name

  # Making the user directory accessable to only the user.
  # chmod -R g+w,o+w path/to/directory
  chmod -R u+rwx,g-rwx,o-rwx /home/$name
}

# Check if the script is being run as root.
# https://askubuntu.com/questions/15853/how-can-a-script-check-if-its-being-run-as-root
if [[ $EUID -ne 0 ]]; then
  echo "The script must be run with root privileges."
  # Return exit status 1 to show that the script was not run and instead failed.
  exit 1
else
  # Calling the make_user function to start the program.
  make_user
fi
