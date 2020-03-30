#!/usr/bin/env bash

sounds="rain
thunderstorm
wind
forest
bonfire
coffeeshop
seaside
train
leaves
waterstream
water
summernight
whitenoise
fan
pinknoise
brownnoise"


mkdir -p files
cd files

fileroot=$PWD
for sound in $sounds
do
    echo "Starting for $sound"
    mkdir -p $sound
    cd $sound
    curl -s "https://cdn2.noisli.com/hls/$sound/$sound.m3u8" -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:73.0) Gecko/20100101 Firefox/73.0' -H 'Accept: */*' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Origin: https://www.noisli.com' -H 'Connection: keep-alive' -H 'Referer: https://www.noisli.com/' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -H 'TE: Trailers' -o $sound.m3u8
    hlses=$(grep .ts "$sound.m3u8"|uniq)
    echo "Found $(echo $hlses|wc -l) files"
    for hlsfile in $hlses
    do
        echo "Downloading $sound/$hlsfile"
        curl -s "https://cdn2.noisli.com/hls/$sound/$hlsfile" -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:73.0) Gecko/20100101 Firefox/73.0' -H 'Accept: */*' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Origin: https://www.noisli.com' -H 'Connection: keep-alive' -H 'Referer: https://www.noisli.com/' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -H 'TE: Trailers' -o $hlsfile &
    done
    wait
    cd $fileroot
done

cd ..
