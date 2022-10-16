#!/bin/bash

#获取该文件所在文件夹的绝对路径
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

show_help() {
  echo "Usage: '$0': [-syh]"
  echo "   -s download softwares and copy configs"
  echo "   -y just copy configs"
  echo "   -d just download"
  echo "   -h show this help"
  exit 1
}

down_files() {
  # 安装必要的软件 
  sudo pacman -Syu --noconfirm \
              zsh ranger fzf neovim cmake feh lua wget curl llvm python ca-certificates \
              xclip man-db unzip npm highlight tmux clang ninja make \
              openssh openssl ctags net-tools htop gdb ripgrep gzip python-pip

  # zsh-plugins
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/powerlevel10k
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting

  # fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install

  # c/cpp/dust debugger
  mkdir -p ~/.local/share/nvim/cpptools/
  cd ~/.local/share/nvim/cpptools/
  wget https://github.com/microsoft/vscode-cpptools/releases/download/v1.12.4/cpptools-linux.vsix
  unzip cpptools-linux.vsix
  chmod +x ~/.local/share/nvim/cpptools/extension/debugAdapters/bin/OpenDebugAD7
  cd $DIR
}

copy_files() {
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
  mkdir -p ~/.local/bin/
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
    d) down_files;;
    s) down_files
       copy_files;;
    h) show_help;;
    ?) show_help;;
  esac
done
