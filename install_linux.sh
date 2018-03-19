#!/bin/bash

if [[ $(grep '\[Profile[^0]\]' ~/.mozilla/firefox/profiles.ini) ]]
then PROFPATH=$(grep -E '^\[Profile|^Path|^Default' ~/.mozilla/firefox/profiles.ini | grep -1 '^Default=1' | grep '^Path' | cut -c6-)
else PROFPATH=$(grep 'Path=' ~/.mozilla/firefox/profiles.ini | sed 's/^Path=//')
fi

PROFPATH=".mozilla/firefox/$PROFPATH"

if [ ! -d ~/"$PROFPATH/chrome" ]; then
  mkdir ~/"$PROFPATH/chrome"
fi

cp -r ./chrome/* ~/"$PROFPATH/chrome"
