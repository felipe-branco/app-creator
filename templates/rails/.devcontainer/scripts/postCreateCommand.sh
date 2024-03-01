#!/bin/zsh

[[ -e Gemfile ]] && APP_ALREADY_CREATED=true || APP_ALREADY_CREATED=false

if [[ $APP_ALREADY_CREATED == false ]]; then
  echo "\n"
  echo 'Installing Rails...'
  echo "\n"

  gem install rails

  echo "\n"
  echo 'Installing Rails [done]'

  echo "\n"
  echo 'Creating Rails app...'

  rails new . --api --database=postgresql

  echo 'Creating Rails app [done]'
  echo "\n"

  echo 'Setting up rspec and solargraph'
  echo "\n"

  # Install rspec
  bundle add rspec-rails --group "development, test"
  bundle add solargraph --group "development"
  bundle install
  bundle exec rails g rspec:install
  rm -rf test

  echo 'Setting up rspec and solargraph [done]'
  echo "\n"

  echo 'Setting up dev database'
  echo "\n"

  bundle exec rails db:create
  bundle exec rails db:migrate

  echo 'Setting up dev database [done]'
  echo "\n"
else
  echo "\n"
  echo 'Installling dependencies'
  echo "\n"

  bundle install

  echo "\n"
  echo 'Installling dependencies [done]'
  echo "\n"

  echo "\n"
  echo 'Setting up dev database'
  echo "\n"

  bundle exec rails db:create
  bundle exec rails db:migrate

  echo "\n"
  echo 'Setting up dev database [done]'
  echo "\n"
fi

echo 'Rails app ready!'
echo "\n"
