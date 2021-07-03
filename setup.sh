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


# ===============
#  START INSTALL 
# ===============
clear

# =========================
#  CHECK REQUIRED PROGRAMS 
# =========================
PROGRAMS="i3 i3status dmenu kitty tmux vim git ranger compton feh"
print_input_message "Install required programs? (y/n):"
read -e INSTALL_PROGRAMS
if [ $INSTALL_PROGRAMS = "n" ]; then
    print_message "Skip installation. Make sure you have everything installed!"
    sleep 4
fi

if [ $INSTALL_PROGRAMS = "y" ]; then
    print_message "Programs to install: '$PROGRAMS'"
    sudo apt install -y $PROGRAMS
fi

# ==============
#  CONFIGURE OS 
# ==============
print_message "Configure OS to boot into text mode (tty)"
sudo systemctl set-default multi-user.target

print_message "Update terminal emulator:"
sudo update-alternatives --config x-terminal-emulator

# ===================
#  INSTALL .dotfiles 
# ===================
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
