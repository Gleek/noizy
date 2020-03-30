#!/usr/bin/env bash
toPlay=$*
sounds=$(ls files/)
count=1
soundCount=$(echo $sounds|wc -w)
tmux set-option -g mouse on
tmux kill-session -t 'noisli'
tmux new-session -t 'noisli' -d
tmux select-layout tiled
for sound in $sounds
do
    paused="--pause"
    [[ $(echo $toPlay | grep -w $sound) ]] && $paused=""
    tmux send-keys "mpv $paused --loop=inf files/$sound/$sound.m3u8" C-m
    echo $count, $soundCount, $sound
    tmux select-layout tiled
    [[ $count -lt $soundCount ]] && tmux split-window -v
    count=$(($count + 1))
done
tmux set-option -g mouse on
tmux -2 attach-session -t 'noisli'
