#!/bin/sh

echo 'Creating Nextjs app...'
npx create-next-app@latest . --use-npm --yes --ts --eslint --no-tailwind --app --no-src-dir --import-alias "@/*" --example with-vitest

if [ ! -d "./app" ]; then
  echo 'Error creating Nextjs app. Remove the app folder created, fix the error above, and run the command again.'
  printf '\n'
  exit 4
fi

echo 'Nextjs app created!'

echo 'Installing prettier...'
npm i prettier eslint-config-prettier eslint-plugin-prettier --save-dev

printf '\n'
echo "-------"
echo "Add prettier npm script to package.json:"
echo "-------"
echo '"verify":"prettier --check . && npm run lint",'
echo '"format":"prettier --write ."'
echo "-------"

echo 'Prettier set!'

if [ "$STYLING" = "styled-components" ]; then
  echo 'Installing styled-components...'
  npm i styled-components
  echo 'Styled-components installed!'
fi

if [ "$STYLING" = "material-ui" ]; then
  echo 'Installing material-ui...'
  npm i @mui/material-nextjs @emotion/cache
  echo 'Material-ui installed!'
fi

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
cp -a "$BASEDIR"/templates/nextjs/.[!.]* .
cp -a "$BASEDIR"/templates/nextjs/app/* ./app

# Remove warning from vite config
mv vitest.config.ts vitest.config.mts

echo 'Done!'
