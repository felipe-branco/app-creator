# AppCreator

Create structured apps from scratch using one command. App types available so far:

- Create a React + Typescript app
- Create a Nextjs app

## Help
```shell
make help
```

## Creating a React (+Typescript) app

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

## Motivation

Automate apps creation using the sames tools for linting, testing and so on every time.

<!--
[TODO]
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
