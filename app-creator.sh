#!/bin/sh

# In case location isn't set
if [ -z "$APPPATH" ]; then
  APPPATH=$APPNAME
fi

# Create app location if it doesn't exist
if [ ! -d "$APPPATH" ]; then
  mkdir -p $APPPATH
fi

# Installs nvm if it's not installed
if ! [ -x "$(command -v nvm)" ]; then
  echo 'nvm is not installed.'
  . ./helper/nvm-installer.sh
  echo 'nvm installed!'
fi

if [ -z "nvm -v" ]; then
  echo "Error: nvm not installed correctly."
  exit 1
fi

nvm install --lts
node -v