#!/bin/sh

echo 'Creating React app...'
npm create vite@latest . -- --template react-ts
echo 'React app created!'

echo 'Installing eslint, prettier, and vitest...'
npm i eslint eslint-import-resolver-typescript eslint-plugin-import --save-dev
npm i prettier eslint-config-prettier eslint-plugin-prettier --save-dev
npm i vitest --save-dev

# Copy template files
cp -a "$BASEDIR"/templates/react/.[!.]* .
cp -a "$BASEDIR"/templates/react/app/* ./src

printf '\n'
echo "-------"
echo "Add eslint and prettier npm scripts to package.json:"
echo "-------"
echo '"lint:fix":"eslint . --fix",'
echo '"verify":"prettier --check . && npm run lint",'
echo '"format":"prettier --write ."'
echo "-------"

echo 'Eslint, prettier, and vitest installed...'
printf '\n'

if [ "$STYLING" = "styled-components" ]; then
  echo 'Installing styled-components...'
  npm i styled-components
  echo 'Styled-components installed!'
fi

if [ "$STYLING" = "material-ui" ]; then
  echo 'Installing material-ui...'
  npm i @mui/material @emotion/react @emotion/styled @emotion/cache
  echo 'Material-ui installed!'
fi
