#!/bin/bash

#获取该文件所在文件夹的绝对路径
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

show_help() {
  echo "Usage: '$0': [-ynpdh]"
  echo "   -s download softwares and copy configs"
  echo "   -y just copy configs"
  echo "   -h show this help"
  exit 1
}

down_files() {
  # 安装必要的软件 
  sudo pacman -Syu zsh ranger fzf neovim cmake feh lua gcc unzip npm highlight \
                   xclip

  # zsh-plugins
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/powerlevel10k
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting

  # fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

copy_files() {
  #安装nerd-font
  sudo cp fonts/* /usr/share/fonts/
  fc-cache -fv
  cd $DIR

  DOT_FILES=(
    ".bash_profile" 
    ".bashrc" 
    ".my_env" 
    ".tmux.conf"
    ".zshrc"
    ".gitconfig"
  )
  for FILE in ${DOT_FILES[@]}
  do
    ln -sf $DIR/$FILE ~/$FILE
  done

  ln -sf $DIR/.config/* ~/.config/
  mkdir ~/.local/bin/vim
  ln -sf $(which nvim) ~/.local/bin/vim
  zsh
  chsh -s /bin/zsh
}

if [ -z $1 ]
then
  show_help
  exit 1
fi

while getopts "ysphd" arg
do
  case $arg in
    y) copy_files;;
    s) down_files
       copy_files;;
    h) show_help;;
    ?) show_help;;
  esac
done
