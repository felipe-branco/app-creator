#!/bin/sh

echo 'Creating modular Node app...'

# Copy template files
cp -a $BASEDIR/templates/node/.[^.]* .
cp -a $BASEDIR/templates/node/* .

echo 'Done!'
