#!/bin/bash

cmd=$(which tmux) #tmux path
SESSION="dev"

if [ -z $cmd ]
then
    echo "Tmux not found.Please install Tmux."
    exit 1
fi

if [ -z $1 ] || [ -z $2 ]
then
    echo "Usage : $0 [project name] [file name]"
    exit 1
fi
SESSION=$1

$cmd has-session -t $SESSION
if [ $? != 0 ]
then
    $cmd new-session -s $SESSION -n editor -d
    $cmd send-keys -t $SESSION:0.0 "nvim $2" C-m
    $cmd new-window -n shell -t $SESSION
    $cmd new-window -n this_script -t $SESSION 
    $cmd send-keys -t $SESSION:2 "nvim $0" C-m
    $cmd new-window -n vimrc -t $SESSION 
    $cmd send-keys -t $SESSION:3 "nvim ~/.tmux.conf" C-m
    $cmd select-window -t $SESSION:0
    $cmd select-pane -t $SESSION:0.0
fi
$cmd attach -t $SESSION

