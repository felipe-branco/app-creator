#!/bin/sh

echo 'Creating Nextjs app...'
npx create-next-app@latest . --use-npm --yes --ts --eslint --tailwind --app --no-src-dir --import-alias "@/*" --example with-vitest with-redux
echo 'Nextjs app created!'

echo 'Installing prettier...'
npm i prettier eslint-config-prettier eslint-plugin-prettier --save-dev

echo "\n"
echo "-------"
echo "Add prettier npm script to package.json:"
echo "-------"
echo '"verify":"prettier --check . && npm run lint",'
echo '"format":"prettier --write ."'
echo "-------"

echo 'Prettier set!'

echo 'Installing styled-components...'
npm i styled-components
echo 'Styled-components installed!'

echo 'Moving things around...'
# Remove some of the default stuff
rm -rf __tests__
rm -rf app/blog
rm -rf app/utils
rm -rf pages
rm -rf styles
rm app/counter.tsx
rm app/counter.test.tsx
# Copy template files
cp -a $BASEDIR/templates/nextjs/.[^.]* .
cp -a $BASEDIR/templates/nextjs/app/* ./app

echo 'Done!'
