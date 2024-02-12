# AppCreator

Create structured apps from scratch using one command. App types available so far:

- Create a React + Typescript app
- Create a Nextjs app
- Create a modular Node app

## Help
```shell
make help
```

## Creating a Nextjs app (Recommended)

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


```shell
make node <app-name=my-app> [app-location=./path/to/app/location] [node-version=version.number]
```

### Requirements

- Docker
- Visual Studio Code
- Dev Containers extension

That's it. Here the full [Dev Containers tutorial](https://code.visualstudio.com/docs/devcontainers/tutorial)

### Packages
```
- pnpm
- Typescript
- Eslint
- Prettier
- Jest
- Esbuild
```

## Motivation

Automate apps creation using the sames tools for linting, testing and so on every time.

<!--
[TODO]
## Creating a rails app
## Creating a modular Node app


```shell
make node-app app-name ./path/to/app/location
```

### Requirements

- Docker
- Visual Studio Code
- Dev Containers extension

That's it. Here the full [Dev Containers tutorial](https://code.visualstudio.com/docs/devcontainers/tutorial)
 -->
