# Node.js Monorepo Application Creation Template

## Overview
This template provides a structured approach for creating Node.js monorepo applications from scratch. Use this guide to generate comprehensive prompts for building scalable, maintainable monorepo projects.

## Prompts

### 1. Creating the the application

```
I want you to act as senior software developer specialist in Typescript. Your tasks are the following:
1. Make sure this is an empty repository
2. Create a turbo monorepo using pnpm and node 22
3. The monorepo should have the following workspaces:
```
"workspaces": [
    "apps/*",
    "packages/*"
  ],
```
4. Create the "web" package within the "apps" workspace for hosting an web application. Do not add anything in it yet.
5. Add an .gitigore file accordingly
```

### 2. Adding tsconfig package

Now I want you to do the following:
1. Create the "tsconfig" package within "packages"
2. Add a "base.json" file in it with the following content:
```
{
  "$schema": "https://json.schemastore.org/tsconfig",
  "compilerOptions": {
    "declaration": true,
    "declarationMap": true,
    "esModuleInterop": true,
    "incremental": false,
    "isolatedModules": true,
    "lib": ["es2022", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "moduleDetection": "force",
    "moduleResolution": "Bundler",
    "noUncheckedIndexedAccess": true,
    "resolveJsonModule": true,
    "skipLibCheck": true,
    "strict": true,
    "target": "ES2022"
  }
}
```
3. Add a "nextjs.json" file in it with the following content:
```
{
  "$schema": "https://json.schemastore.org/tsconfig",
  "extends": "./base.json",
  "compilerOptions": {
    "plugins": [{ "name": "next" }],
    "module": "ESNext",
    "moduleResolution": "Bundler",
    "allowJs": true,
    "jsx": "preserve",
    "noEmit": true
  }
}
```
4. Add a "react.json" file in it with the following content:
```
{
  "$schema": "https://json.schemastore.org/tsconfig",
  "extends": "./base.json",
  "compilerOptions": {
    "jsx": "react-jsx"
  }
}
```
5. Call this package "@<app-acronym>/tsconfig"

### 3. Adding Nextjs app
Now I want you to do the following:
1. Create a Nextjs application within "apps/web" without tailwind and it includes material UI
2. Make sure it uses "vitest" as it test engine
3. Add "@<app-acronym>/tsconfig" as a dev dependency of the "app/web" package
4. Make the "app/web" package extend from the "nextjs.json" from the "@<app-acronym>/tsconfig" package
5. Add an .gitigore file accordingly

### 4. Setup linter
Now I want you to do the following:
1. Create the package "eslint-config" within the packages folder
2. Name it "@<app-acronym>/eslint-config"
3. Update its package.json to exact this:
```
{
  "name": "@<app-acronym>/eslint-config",
  "version": "0.0.0",
  "type": "module",
  "private": true,
  "exports": {
    "./base": "./base.js",
    "./next-js": "./next.js",
    "./react-internal": "./react-internal.js"
  },
  "devDependencies": {
    "@eslint/js": "^9.27.0",
    "@next/eslint-plugin-next": "^15.3.0",
    "eslint": "^9.27.0",
    "eslint-config-prettier": "^10.1.1",
    "eslint-plugin-only-warn": "^1.1.0",
    "eslint-plugin-react": "^7.37.4",
    "eslint-plugin-react-hooks": "^5.2.0",
    "eslint-plugin-turbo": "^2.5.0",
    "globals": "^16.2.0",
    "typescript": "^5.8.2",
    "typescript-eslint": "^8.32.0"
  }
}
```
4. Create the "base.js" file with this exact content:
```
import js from '@eslint/js'
import eslintConfigPrettier from 'eslint-config-prettier'
import turboPlugin from 'eslint-plugin-turbo'
import tseslint from 'typescript-eslint'
import onlyWarn from 'eslint-plugin-only-warn'

/**
 * A shared ESLint configuration for the repository.
 *
 * @type {import("eslint").Linter.Config[]}
 * */
export const config = [
  js.configs.recommended,
  eslintConfigPrettier,
  ...tseslint.configs.recommended,
  {
    plugins: {
      turbo: turboPlugin,
    },
    rules: {
      'turbo/no-undeclared-env-vars': 'warn',
    },
  },
  {
    plugins: {
      onlyWarn,
    },
  },
  {
    ignores: ['dist/**'],
  },
]

```
5. Create the "next.js" file with this exact content:
```
import js from '@eslint/js'
import eslintConfigPrettier from 'eslint-config-prettier'
import tseslint from 'typescript-eslint'
import pluginReactHooks from 'eslint-plugin-react-hooks'
import pluginReact from 'eslint-plugin-react'
import globals from 'globals'
import pluginNext from '@next/eslint-plugin-next'
import { config as baseConfig } from './base.js'

/**
 * A custom ESLint configuration for libraries that use Next.js.
 *
 * @type {import("eslint").Linter.Config[]}
 * */
export const nextJsConfig = [
  ...baseConfig,
  js.configs.recommended,
  eslintConfigPrettier,
  ...tseslint.configs.recommended,
  {
    ...pluginReact.configs.flat.recommended,
    languageOptions: {
      ...pluginReact.configs.flat.recommended.languageOptions,
      globals: {
        ...globals.serviceworker,
      },
    },
  },
  {
    plugins: {
      '@next/next': pluginNext,
    },
    rules: {
      ...pluginNext.configs.recommended.rules,
      ...pluginNext.configs['core-web-vitals'].rules,
    },
  },
  {
    plugins: {
      'react-hooks': pluginReactHooks,
    },
    settings: { react: { version: 'detect' } },
    rules: {
      ...pluginReactHooks.configs.recommended.rules,
      // React scope no longer necessary with new JSX transform.
      'react/react-in-jsx-scope': 'off',
    },
  },
]

```
6. Create the "react-internal.js" file with this exact content:
```
import js from '@eslint/js'
import eslintConfigPrettier from 'eslint-config-prettier'
import tseslint from 'typescript-eslint'
import pluginReactHooks from 'eslint-plugin-react-hooks'
import pluginReact from 'eslint-plugin-react'
import globals from 'globals'
import { config as baseConfig } from './base.js'

/**
 * A custom ESLint configuration for libraries that use React.
 *
 * @type {import("eslint").Linter.Config[]} */
export const config = [
  ...baseConfig,
  js.configs.recommended,
  eslintConfigPrettier,
  ...tseslint.configs.recommended,
  pluginReact.configs.flat.recommended,
  {
    languageOptions: {
      ...pluginReact.configs.flat.recommended.languageOptions,
      globals: {
        ...globals.serviceworker,
        ...globals.browser,
      },
    },
  },
  {
    plugins: {
      'react-hooks': pluginReactHooks,
    },
    settings: { react: { version: 'detect' } },
    rules: {
      ...pluginReactHooks.configs.recommended.rules,
      // React scope no longer necessary with new JSX transform.
      'react/react-in-jsx-scope': 'off',
    },
  },
]
```
7. Add this new package as a dev dependency in the "apps/web" next application
8. Finally create the "eslint.config.js" file within "apps/web" packages with this exact content:
```
import { nextJsConfig } from '@nwa/eslint-config/next-js'

/** @type {import("eslint").Linter.Config} */
export default nextJsConfig

```
9. Add "lefthook" to the root package
10. Add the following to "lefthook.yml" file:
```
pre-commit:
  parallel: true
  commands:
    eslint:
      glob: '*.{js,ts,jsx,tsx}'
      run: pnpm lint
    prettier:
      glob: '*.{js,ts,jsx,tsx,css,scss,json,md}'
      run: pnpm prettier --write {staged_files} && git add {staged_files}
```
11. Create the ".prettierrc" file with this exact content:
```
{
  "printWidth": 120,
  "endOfLine": "lf",
  "singleQuote": true,
  "arrowParens": "always",
  "trailingComma": "es5",
  "semi": false,
  "tabWidth": 2,
  "useTabs": false
}
```
12. Create a ".prettierignore" file with this exact content:
```
.next
dist
.db_data
```