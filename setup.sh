#!/bin/bash
sudo pacman -Syu --noconfirm git
cd ~
git clone https://github.com/zqlyz/dotfiles.git
cd dotfiles
./arch-setup.sh -s
