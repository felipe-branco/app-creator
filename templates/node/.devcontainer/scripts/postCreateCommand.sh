#!/bin/zsh

[ -e package.json ] && APP_ALREADY_CREATED=true || APP_ALREADY_CREATED=false

if [ "$APP_ALREADY_CREATED" = false ]; then
  npm init -y
  npm i -g pnpm
  pnpm i -w -D typescript jest ts-jest prettier eslint eslint-config-prettier esbuild esbuild-node-externals
  pnpm i -w -D @types/jest @types/node @typescript-eslint/eslint-plugin @typescript-eslint/parser
fi
