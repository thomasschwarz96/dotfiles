#!/bin/bash

# Global variables
# ===========
PREFIX="[dotfiles-setup]"
EXISTING=()

# Printing message for user input 
# ===========
function print_input_message() {
    echo -n "${PREFIX}" $1 ""
}

# Printing message to user 
# ===========
function print_message() {
    echo "${PREFIX}" $1
}

# Check if given path is writeable
# ===========
function is_writeable() {
    destination=$1
    if [ -w "${destination}" ]; then 
        return 1 
    fi
    return 0 
}

# Copy all config files to destination
# ===========
function do_setup() {
    cp -R . $DESTINATION
    rm "${DESTINATION}/LICENSE"
    rm "${DESTINATION}/README.md"
    rm "${DESTINATION}/setup.sh"
    rm -rf "${DESTINATION}/.git"
}


# ===========
#  START APP 
# ===========
clear
print_input_message "Destination path for setup (enter to use $HOME):"
read -e DESTINATION
if test -z "$DESTINATION" 
then
    echo ""
    DESTINATION=$HOME
fi

if is_writeable $DESTINATION; then
    print_message "Destination is not writeable!"
    exit
fi

print_input_message "Are you sure to copy the dotfiles? (y/n):"
read -e COPY
if [ $COPY = "n" ]; then
    print_message "Cancel setup!"
    exit
fi

print_input_message "Start setup..."
do_setup
echo "DONE"

print_message "Future terminals got the new config!"
print_message "Have fun!"
