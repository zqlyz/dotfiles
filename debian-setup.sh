#!/bin/bash

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
    git w3m unzip curl doxygen lua5.3\
    fonts-noto-cjk pkg-config \
    ninja-build gettext libtool libtool-bin \
    autoconf automake cmake g++ fontconfig

#  # 安装最新的neovim
#  git clone https://github.com/neovim/neovim
#  cd $DIR/neovim 
#  git checkout stable
#  make CMAKE_BUILD_TYPE=Release
#  sudo make -j4 install
#  cd $DIR

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
    p) pc4=proxychains4;;
    d) delete_files;;
    s) down_files
       copy_files;;
    h) show_help;;
    ?) show_help;;
  esac
done
