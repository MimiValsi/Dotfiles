#!/bin/bash

# Paths
nvim="$HOME/.config/nvim"
tmux="$HOME/.config/tmux"

# Xorg
X_polybar="$HOME/.config/polybar"
X_i3="$HOME/.config/i3"

# Wayland
waybar="$HOME/.config/waybar"
sway="$HOME/.config/sway"

function help() {
    echo "./dotfiles [argument]"
    echo "- (no arguments):    Prints this page"
    echo "- install_wayland: Install Wayland minimal config and third-parties programs"
    echo "- install_X: 	     Install Xorg minimal config and third-parties programs"
}

function install_X() {
  pacman -S --needed --noconfirm xorg i3
  # First create directories then copy
  mkdir -p "${X_polybar}" "${nvim}" "${X_i3}"
}

function install_packages() {
  # Install all apps thrown here
  pacman -S --noconfirm --needed brightnessctl curl firewalld foot git go ImageViewer jack2 lazygit npm nvim \
    openssh otf-font-awesome jq nftables postgresql pulseaudio pulseaudio-bluetooth tmux ttf-firacdode-nerd \
    unzip zig zsh yay wireshark wget

  # Brave
  curl -fsS https://dl.brave.com/install.sh | sh

  # install oh my zsh
  wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
  sh install.sh
  chsh -s "$(which zsh)"

  echo "if [ \"\$TMUX\" = \"""\" ]; then tmux new \; set-option destroy-unattached; fi" >> "$HOME/.zshrc"

  echo "copying nvim to ${nvim}..."
  cp -r "./nvim/" "${nvim}"

  echo "copying tmux to ${tmux}..."
  cp -t "./tmux/" "${tmux}"
}

function test() {
  echo "Some cmds tests here"
  echo "if [ \"\$TMUX\" = \"""\" ]; then tmux new \; set-option destroy-unattached; fi" >> "./test.txt"
}

function install_wayland() {
  pacman -S --noconfirm --needed wayland waybar sway swaybg swayidle swaylock
  install_packages

  # First create folders
  mkdir -p "${waybar}" "${sway}" "${nvim}"

  echo "copying waybar to ${waybar}..."
  cp -r "./wayland/waybar/" "${waybar}"

  echo "copying sway to ${sway}..."
  cp -r "./wayland/sway/" "${sway}"
}

# Start
case $1 in
    "copy")
        copy
        ;;
    "install_X")
        install_X
        ;;
    "install_wayland")
	install_wayland
        ;;
    "test")
        test
	;;
    *)
        help
        ;;
esac

