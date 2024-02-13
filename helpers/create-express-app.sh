#!/bin/sh

echo 'Creating Express + Typescript app...'

npm init -y
npm i express cors
npm i @types/express @types/cors typescript ts-node-dev jest ts-jest @types/jest --save-dev
npx tsc --init

cp -a $BASEDIR/templates/express/* ./

echo "\n"
echo "-------"
echo "Add the following npm scripts to package.json:"
echo "-------"
echo '"test":"jest",'
echo '"dev":"ts-node-dev --inspect --transpile-only --ignore-watch node_modules src/server.ts",'
echo '"build":"tsc"'
echo "-------"

echo 'Done!'