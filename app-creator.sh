#!/bin/sh

export BASEDIR=$(cd $(dirname $0) && pwd)

DEVCONTAINER_APP=false
if [[ $APPTYPE == "node" || $APPTYPE == "rails" ]]; then
  DEVCONTAINER_APP=true
fi

IS_NODE_APP=false
if [[ $APPTYPE == "node" || $APPTYPE == "nextjs" || $APPTYPE == "react" || $APPTYPE == "express" ]]; then
  IS_NODE_APP=true
fi

[[ $DEVCONTAINER_APP == false && $IS_NODE_APP == true ]] && FRONTEND_APP=true || FRONTEND_APP=false

create_app_folder() {
  # In case location isn't set
  if [ -z "$APPPATH" ]; then
    APPPATH=$APPNAME
  fi

  # Create app location if it doesn't exist
  if [ ! -d "$APPPATH" ]; then
    mkdir -p $APPPATH
  fi
}

installs_frontend_local_dependencies() {
  if [ $FRONTEND_APP == true ]; then
    # Installs nvm if it's not installed
    if ! [ -x "$(command -v nvm)" ]; then
      echo 'nvm is not installed.'
      . "$BASEDIR/helpers/nvm-installer.sh"
      echo 'nvm installed!'
    fi

    # Exit if nvm hasn't been successfully instaled
    if [ -z "nvm -v" ]; then
      echo "Error: nvm not installed correctly."
      exit 1
    fi

    # Install lastest node version as default
    echo $NODEVERSION
    if [ -z "$NODEVERSION" ]; then
      nvm install --lts
    else
      nvm install $NODEVERSION
    fi

    # Exit if node hasn't been successfully instaled
    if [ -z "node -v" ]; then
      echo "Error: node not installed correctly."
      exit 2
    fi
  fi
}

create_env_rc_files() {
  echo "create_env_rc_files1"
  if [ $IS_NODE_APP == true ]; then
    echo "create_env_rc_files2"
    # Creates node-version file
    if [ -e ".node-version" ]; then
      rm ".node-version"
    fi
    NODEINSTALLED=$(command node -v)
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
  cd $APPPATH
  if [ $APPTYPE == "react" ]; then
    . "$BASEDIR/helpers/create-react-app.sh"
  elif [ $APPTYPE == "nextjs" ]; then
    . "$BASEDIR/helpers/create-nextjs-app.sh"
  elif [ $APPTYPE == "node" ]; then
    . "$BASEDIR/helpers/create-node-app.sh"
  elif [ $APPTYPE == "express" ]; then
    . "$BASEDIR/helpers/create-express-app.sh"
  elif [ $APPTYPE == "rails" ]; then
    . "$BASEDIR/helpers/create-rails-app.sh"
  fi

  create_env_rc_files
  exit 0
}

main
