#!/bin/sh

BASEDIR=$(cd "$(dirname "$0")" && pwd)
export BASEDIR


DEVCONTAINER_APP=false
if [ "$APPTYPE" = "node" ] || [ "$APPTYPE" = "rails" ]; then
  DEVCONTAINER_APP=true
fi

IS_NODE_APP=false
if [ "$APPTYPE" = "node" ] || [ "$APPTYPE" = "nextjs" ] || [ "$APPTYPE" = "react" ] || [ "$APPTYPE" = "express" ]; then
  IS_NODE_APP=true
fi

[ $DEVCONTAINER_APP = false ] && [ $IS_NODE_APP = true ] && FRONTEND_APP=true || FRONTEND_APP=false

if [ "$STYLING" = "styled-components" ] || [ "$STYLING" = "material-ui" ]; then
  export STYLING
fi

create_app_folder() {
  # In case location isn't set
  if [ -z "$APPPATH" ]; then
    APPPATH=$APPNAME
  fi

  # Create app location if it doesn't exist
  if [ ! -d "$APPPATH" ]; then
    mkdir -p "$APPPATH"
  fi
}

installs_frontend_local_dependencies() {
  if [ "$FRONTEND_APP" = true ]; then
    # Installs nvm if it's not installed
    if ! [ -x "$(command -v nvm)" ]; then
      echo 'nvm is not installed.'
      # shellcheck disable=SC1091
      . "$BASEDIR/helpers/nvm-installer.sh"
      echo 'nvm installed!'
    fi

    # Exit if nvm hasn't been successfully instaled
    if [ -z "nvm -v" ]; then
      echo "Error: nvm not installed correctly."
      exit 1
    fi

    # Install lastest node version as default
    echo "$NODEVERSION"
    if [ -z "$NODEVERSION" ]; then
      nvm install --lts
    else
      nvm install "$NODEVERSION"
    fi

    # Exit if node hasn't been successfully instaled
    if [ -z "node -v" ]; then
      echo "Error: node not installed correctly."
      exit 2
    fi
  fi
}

create_env_rc_files() {
  if [ $IS_NODE_APP = true ]; then
    # Creates node-version file
    if [ -e ".node-version" ]; then
      rm ".node-version"
    fi
    NODEINSTALLED=$(command node -v)
    # shellcheck disable=SC3057
    touch ".node-version" && echo "${NODEINSTALLED:1}" >> .node-version

    # Creates nvmrc file
    if [ -e ".nvmrc" ]; then
      rm ".nvmrc"
    fi
    NODEINSTALLED=$(command node -v)
    touch ".nvmrc" && echo "$NODEINSTALLED" >> .nvmrc
  fi
}

main() {

  create_app_folder
  installs_frontend_local_dependencies

  # Installs app depending on its type
  cd "$APPPATH" || exit 3
  # shellcheck disable=SC1090
  . "$BASEDIR/helpers/create-$APPTYPE-app.sh"

  create_env_rc_files
  exit 0
}

main
