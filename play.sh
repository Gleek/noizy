#!/usr/bin/env bash
combs=$*
echo $combs

for play in $combs
do
    [[ -d files/$play ]] && mpv --loop=inf files/$play/$play.m3u8 &
done
wait
