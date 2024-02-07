#!/bin/sh

echo 'Creating React app...'
npx create-react-app . --template typescript
npm i @babel/plugin-proposal-private-property-in-object --save-dev # Fix babel warning
echo 'React app created!'

echo 'Installing eslint and prettier...'
npm i eslint eslint-import-resolver-typescript eslint-plugin-import --save-dev
npm i prettier eslint-config-prettier eslint-plugin-prettier --save-dev

# Copy template files
cp -a $BASEDIR/templates/react/.[^.]* .
cp -a $BASEDIR/templates/react/app/* ./src

echo "\n"
echo "-------"
echo "Add eslint and prettier npm scripts to package.json:"
echo "-------"
echo '"lint":"eslint .",'
echo '"lint:fix":"eslint . --fix",'
echo '"verify":"prettier --check . && npm run lint",'
echo '"format":"prettier --write ."'
echo "-------"

echo 'Eslint and prettier set!'

echo 'Installing styled-components...'
npm i styled-components
echo 'Styled-components installed!'
