#!/bin/bash
#获取该文件绝对路径
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#遍历文件复制到~
for FILE in `ls -a ${DIR}`
do
    case $FILE in
        ".") ;;
        "..") ;;
        "README.md") ;;
        "setup.sh");;
        ".git");;
        ".gitmodules");;
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
