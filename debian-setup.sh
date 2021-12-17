#!/bin/bash

PC4=

#获取该文件所在文件夹的绝对路径
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

show_help() {
  echo "Usage: '$0': [-ynpdh]"
  echo "   -s download softwares and copy configs"
  echo "   -p using proxychains4 for download"
  echo "   -y just copy configs"
  echo "   -d delete the files which downloaded from installing"
  echo "   -h show this help"
  exit 1
}

delete_files() {
  rm -rf neovim install.sh
  exit 1
}

down_files() {
  # 安装必要的软件
  sudo apt -y install zsh feh ranger exuberant-ctags \
              git fzf w3m unzip curl doxygen\
              fonts-noto-cjk proxychains4 pkg-config \
              ninja-build gettext libtool libtool-bin \
              autoconf automake cmake g++

  # 安装最新的neovim
  $PC4 git clone https://github.com/neovim/neovim
  cd $DIR/neovim 
  git checkout stable
  $PC4 make CMAKE_BUILD_TYPE=Release
  sudo make install
  cd $DIR

  # oh-my-zsh
  $PC4 wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
  chmod +x install.sh
  $PC4 sh install.sh

  # zsh-autosuggestions
  $PC4 git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
}

copy_files() {
  #安装nerd-font
  sudo cp fonts/* /usr/share/fonts/

  DOT_FILES=(
    ".bash_profile" 
    ".bashrc" 
    ".my_alias" 
    ".my_env" 
    ".tmux.conf"
    ".zshrc"
    ".oh-my-zsh/themes/my-theme.zsh-theme"
    ".gitconfig"
  )
  for FILE in ${DOT_FILES[@]}
  do
    ln -sf $DIR/$FILE ~/$FILE
  done

  ln -sf $DIR/.config/* ~/.config/
  sudo ln -sf $(which nvim) /usr/local/bin/vim
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
    p) pc4=proxychains4;;
    d) delete_files;;
    s) down_files
       copy_files;;
    h) show_help;;
    ?) show_help;;
  esac
done
