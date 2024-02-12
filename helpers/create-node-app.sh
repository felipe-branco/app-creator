#!/bin/sh

echo "\n"
echo 'Creating modular Node app...'

# Copy template files
cp -a $BASEDIR/templates/node/.[^.]* .
cp -a $BASEDIR/templates/node/* .

echo "\n"
echo "-------"
echo "Once your workspace is ready, add to "scripts" in the root package.json:"
echo "-------"
echo '"test": "jest",'
echo '"build": "pnpm -r --stream build",'
echo '"lint:fix": "pnpm lint --fix",'
echo '"lint": "eslint . --ext .ts,.tsx"'
echo "-------"
echo "\n"

echo 'Done!'
echo 'Now follow the instructions in the README file to spin up your workspace.'
