#!/bin/sh

echo 'Creating modular Node app...'

# Copy template files
cp -a $BASEDIR/templates/node/.[^.]* .
cp -a $BASEDIR/templates/node/* .

echo "\n"
echo "-------"
echo "Once your workspace is ready, add to package.json:"
echo "-------"
echo '"test": "jest",'
echo '"build": "pnpm -r --stream build",'
echo '"lint:fix": "pnpm lint --fix",'
echo '"lint": "eslint . --ext .ts,.tsx"'
echo "-------"

echo 'Done!'
