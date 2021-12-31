#!/usr/bin/env bash

#######################################
# Устанавливает дополнительные пакеты #
#######################################

# Серфинг
sudo pacman -Sy --noconfirm firefox 

# Редакторы
sudo pacman -Sy --noconfirm neovim python-pynvim ripgrep

# Терминал
sudo pacman -Sy --noconfirm kitty tmux task fish fzf ranger
