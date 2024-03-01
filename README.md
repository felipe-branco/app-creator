# AppCreator

Create structured apps from scratch using one command. App types available so far:

- [Create a Nextjs app](#creating-a-nextjs-app)
- [Create a React + Typescript app](#creating-a-react-typescript-app)
- [Create a modular Node app](#creating-a-modular-node-app)
- [Create a Ruby on Rails app](#creating-a-ruby-on-rails-app)

## Help
```shell
make help
```

## Creating a Nextjs app

```shell
make nextjs <app-name=my-app> [app-location=./path/to/app/location] [node-version=version.number]
```

### Packages
```
- Eslint
- Prettier
- Vitest
- Redux
- Styled components
```

## Creating a React (+Typescript) app

As of now `create-react-app` hasn't caught up with most up-to-date dependencies.

```shell
make react <app-name=my-app> [app-location=./path/to/app/location] [node-version=version.number]
```

### Packages
```
- Typescript
- Eslint
- Prettier
- Jest
- Redux
- Styled components
```

## Creating a modular Node app

### Requirements

- Docker
- Visual Studio Code
- Dev Containers extension

That's it. No need to install anything locally. Here's the full [Dev Containers tutorial](https://code.visualstudio.com/docs/devcontainers/tutorial).

### Recommended
Make sure `app-location` is an empty git repository.

### Steps
1. Make AppCreator create the app for you
```shell
make node <app-name=my-app> [app-location=./path/to/app/location]
```
* As of now it uses the latest node stable version

2. Go to the app folder
```shell
cd ./path/to/app/location
```
3. Open VS Code
```shell
code .
```
4. Click on the Dev Containers extension icon

![Click on the Dev Containers extension icon](https://github.com/jwasham/coding-interview-university/assets/5504589/787c47e5-77be-4ca7-92cc-93905fdaeeea)

5. Click on the '+' icon on the extension's explorer right corner

![Click on the '+' icon on the extension's explorer right corner](https://github.com/jwasham/coding-interview-university/assets/5504589/f7b820bd-deda-4a94-8bad-361fe238c8dd)

6. Selects the "Open Current Folder in Container" option

![Selects the "Open Current Folder in Container" option](https://github.com/jwasham/coding-interview-university/assets/5504589/701361ee-7eb0-4a5a-b67e-cd0ea23d2080)

7. Wait the project's setup and open a terminal on the container workspace
8. Check the available commands on the project's README file

### Packages
```
- pnpm
- Typescript
- Eslint
- Prettier
- Jest
- Esbuild
```

## Creating a Ruby on Rails app

### Requirements

- Docker
- Visual Studio Code
- Dev Containers extension

That's it. No need to install anything locally. Here's the full [Dev Containers tutorial](https://code.visualstudio.com/docs/devcontainers/tutorial).

### Recommended
Make sure `app-location` is an empty repository.

### Steps
1. Make AppCreator create the app for you
```shell
make rails <app-name=my-app> [app-location=./path/to/app/location]
```
* As of now it uses the ruby 3.1 for stability on all hardware architectures

2. Go to the app folder
```shell
cd ./path/to/app/location
```
3. Open VS Code
```shell
code .
```
4. Click on the Dev Containers extension icon

![Click on the Dev Containers extension icon](https://github.com/jwasham/coding-interview-university/assets/5504589/787c47e5-77be-4ca7-92cc-93905fdaeeea)

5. Click on the '+' icon on the extension's explorer right corner

![Click on the '+' icon on the extension's explorer right corner](https://github.com/jwasham/coding-interview-university/assets/5504589/f7b820bd-deda-4a94-8bad-361fe238c8dd)

6. Selects the "Open Current Folder in Container" option

![Selects the "Open Current Folder in Container" option](https://github.com/jwasham/coding-interview-university/assets/5504589/701361ee-7eb0-4a5a-b67e-cd0ea23d2080)

7. Wait the project's setup and open a terminal on the container workspace
8. Check the available commands on the project's README file

## Motivation

Automate apps creation using the sames tools for linting, testing and so on every time.

