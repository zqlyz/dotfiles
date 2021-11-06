#!/bin/bash

pc4=
down_flag=1

#获取该文件所在文件夹的绝对路径
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

showhelp() {
    echo "Usage: 'basename $1': [-n] [-p] [-d] [-h]"
    echo "   -n don't download any softwares, just copy config"
    echo "   -p using proxychains4 for github download"
    echo "   -d delete the file which downloaded from installing"
    echo "   -h show this help"
    exit 1
}

delete_file() {
    rm -rf nvim-linux64.tar.gz nvim-linux64 install.sh nodejs-install.sh
}

while getopts "nphd" arg
do
    case $arg in
        n)  down_flag=0;;
        p)  pc4=proxychains4;;
        d)  delete_file
            down_flag=0
            ;;
        h)  showhelp;;
        ?)  showhelp;;
    esac
done

if [ $down_flag == 1 ];
then
    # 安装最新的nodejs
    curl -sL install-node.vercel.app/lts > nodejs-install.sh
    chmod +x nodejs-install.sh
    sudo ./nodejs-install.sh

    # 安装必要的软件
    sudo apt -y install zsh feh npm ranger exuberant-ctags \
                        git fzf w3m fonts-powerline \
                        fonts-noto-cjk proxychains4 pkg-config \
                        ninja-build gettext libtool libtool-bin \
                        autoconf automake cmake g++ pkg-config \
                        unzip curl doxygen

    # 安装最新的neovim
    $pc4 git clone https://github.com/neovim/neovim
    cd $DIR/neovim && $pc4 make -j4
    sudo make install
    cd $DIR

    # oh-my-zsh
    $pc4 wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    chmod +x install.sh
    sh install.sh
    
    # zsh-autosuggestions
    $pc4 git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

    #yarn
    npm install -y yarn
fi
#安装nerd-font
sudo cp fonts/* /usr/share/fonts/

#遍历文件复制到~
for FILE in `ls -a ${DIR}`
do
    case $FILE in
        ".") ;;
        "..") ;;
        ".git") ;;
        ".gitmodules") ;;
        ".gitignore") ;;
        "README.md") ;;
        "debian-setup.sh") ;;
        "install.sh") ;;
        "nodejs-install.sh") ;;
        "tools") ;;
        "fonts") ;;
        "neovim") ;;
        *)
            STR_TEMP="$DIR/$FILE"
            if [ -d $STR_TEMP ]
            then
                cp -r $STR_TEMP ~ 
            else
                cp $STR_TEMP ~
            fi
        ;;
    esac
done
