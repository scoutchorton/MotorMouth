#!/usr/bin/env bash

#
# Variables
#
URLPREFIX="https://www.ipachart.com/mp3/" 
NAMEDATA="$(cat ipaSamples.txt)"

#
# File processing
#
[ -d 'mp3' ] || mkdir mp3
[ -n "$(ls mp3)" ] && rm mp3/*

#
# Downloading
#
echo "### Iterating over items... ###"
for item in $NAMEDATA; do
	echo "Downloading $(echo $item | cut -f 1 -d ':' | sed 's/_/ /g')..."
	wget -q --show-progress -O "mp3/$(echo $item | cut -f 1 -d ':').mp3" "$URLPREFIX$(echo $item | cut -f 1 -d ':').mp3"
done
