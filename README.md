# Toffy's Dotfiles
Config for teminal environment

There are some softwares will be installed.
* zsh (replace bash)
* feh (image viewer for terminal)
* ranger (file manager for terminal)
* w3m (brower for terminal)
* ctags
* cmake
* git
* fzf
* fonts-noto-cjk
* nerd-font (fira code)

## Usage
```bash
cd ~
git clone https://github.com/zqlyz/dotfiles.git
cd dotfiles
./debian-setup.sh
```
Install neovim
https://github.com/neovim/neovim/wiki/Building-Neovim

Then use nvim
```nvim
:PackerSync
```

### Remember use the font "FiraCode nerd font" for terminal.
### Modify .my_env file for proxy setting.
