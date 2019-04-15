#!/bin/bash

cmd=$(which tmux) #tmux path

if [ -z $cmd ]
then
    echo "Tmux not found.Please install Tmux."
    exit 1
fi

if [ -z $1  ]
then
   SESSION="dev"
else
   SESSION=$1 
fi

$cmd has-session -t $SESSION
if [ $? != 0 ]
then
    $cmd new-session -s $SESSION -n editor -d
    $cmd split-window -v -p 5 -t $SESSION:0
    $cmd send-keys -t $SESSION:0.0 "vim $2" C-m
    $cmd new-window -n shell -t $SESSION
    $cmd new-window -n tmux_script -t $SESSION 
    $cmd send-keys -t $SESSION:2 "vim $0" C-m
    $cmd select-window -t $SESSION:0
    $cmd select-pane -t $SESSION:0.0
fi
$cmd attach -t $SESSION

