#!/bin/bash

# Paths
dotfiles="$HOME/Dotfiles"
emacsd="$HOME/.emacs.d"
nvim="$HOME/.config/nvim"
polybar="$HOME/.config/polybar"
i3="$HOME/.config/i3"
testDir="$HOME/test_git_dir"

####################################################
# Description:
#    help function that prints every cmd and usage
#
# Globals:
#    none
#
# Arguments:
#    none
#
# Outputs:
#    none
#
# Returns:
#    0 if successful, non-zero if error.
####################################################
function help() {
    echo "./dotfiles <argument>"
    echo "- help:    Prints this page"
    echo "- copy:    Copy every folder to Dotfiles"
    echo "- install: Install every folder to it's respective place"
}

####################################################
# Description:
#    Copy concerned folders to my dotfiles
#
# Globals:
#    none
#
# Arguments:
#    none
#
# Outputs:
#    none
#
# Returns:
#    0 if successful, non-zero if error.
####################################################
function copy() {
    # first create all directories if they don't exist.
    mkdir -p .emacs.d nvim i3 polybar
    
    cp -r --update \
       ${emacsd}/init.el \
       ${emacsd}/early-init.el \
       ${emacsd}/custom_packages/ \
       ${dotfiles}/.emacs.d

    cp -r --update ${nvim} ${dotfiles}/nvim
    cp -r --update ${polybar} ${dotfiles}/polybar
    cp -r --update ${i3} ${dotfiles}/i3
}

####################################################
# Description:
#    Install every folder/file @ it's place
#
# Globals:
#    none
#
# Arguments:
#    none
#
# Outputs:
#    none
#
# Returns:
#    0 if successful, non-zero if error.
####################################################
function install() {
    # First create directories then copy
    mkdir -p ${emacsd} ${polybar} ${nvim} ${i3}
    
    #cp -r ${dotfiles}/polybar ${polybar}
    #cp -r ${dotfiles}/i3 ${i3}
    cp -r ${dotfiles}/.emacs.d $HOME/
    cp -r ${dotfiles}/nvim $HOME/.config/
    emacs & urxvt -e nvim &
}

function test() {
    echo "test function"
}

# Start
case $1 in
    "copy")
        copy
        ;;
    "install")
        install
        ;;
    "test")
        test
        ;;
    *)
        help
        ;;
esac

