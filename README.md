# Toffy's Dotfiles
Configuration for teminal environment

There are some softwares will be installed.
* zsh (replace bash)
* feh (image viewer for terminal)
* neovim
* nodejs (coc.nvim server)
* npm
* yarn
* ranger (file manager for terminal)
* w3m (brower for terminal)
* ctags
* cmake
* git
* fzf
* oh-my-zsh
* noto-sans-cjk (Chinese font)
* nerd-font (Source Code Pro)

## Optional install
* vim

## Usage
```bash
cd ~
git clone https://github.com/zqlyz/dotfiles.git
cd dotfiles
./ubuntu-setup.sh
```
Then use vim
```
:PlugInstall
```
Install coc.nvim dependencies and compile
```
cd ~/.vim/plugged/coc.nvim/
yarn install
yarn build
```
Install coc.nvim extensions like:
```
:CocInstall coc-cpp coc-json
```
## Remember use the font "Source Code Pro nerd-font" for terminal.
