#!/usr/bin/env bash

choices=$1
[[ -z $choices ]] && choices=3
sounds=$(ls files|shuf -n $choices |xargs)
echo "Playing $sounds"
./play-tmux.sh $sounds

