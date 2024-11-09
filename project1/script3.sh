#!/bin/bash

# Script that will call the other two scripts.

# The script_main() function contains the program code.
script_main () {
echo "Install all packages from packages file; A"
echo ""
echo "Make symbolic links from configuration files; B"
echo ""
echo "Or Both; both"

# Take user input and put into variable choice.
read choice

# https://www.tutorialspoint.com/unix/case-esac-statement.htm
case $choice in
  "A"|"a")
    # if either A or a is entered run script1 (install packages)
    ./script1
    ;;
  "B"|"b")
    # if either B or b is entered run script2 (make symbolic links) 
    ./script2
    ;;
  "both")
    # if "both" is entered run script1 and script2.
    ./script1
    ./script2
    ;;
  *)
    echo "Please enter a valid option"
    echo "Such as A,B or the word 'both'."
    echo ""
    # Calling script program, after asking user to enter a valid argument.
    script_main
    exit 1
    # Returning exit status 1 to show that the user entered a value that is unrecognized by the script.
    ;;
esac
}

# Check if the script is being run as root.
# https://askubuntu.com/questions/15853/how-can-a-script-check-if-its-being-run-as-root
if [[ $EUID -ne 0 ]]; then
  echo "The script must be run with root privileges."
  # Return exit status 1 to show that the script was not run with root privileges.
  exit 1
else
  # Calling the script function to start the program.
  script_main
fi
