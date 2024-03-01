#!/bin/sh

printf '\n'
echo 'Creating Rails app...'

# Copy template files
cp -a "$BASEDIR"/templates/rails/.[!.]* .

echo 'Done!'
printf '\n'

echo 'Now open VsCode with Devcontainer extension installed and spin up your rails app!'
printf '\n'

STATUS=0
FILENAME="Gemfile.lock"
while [ $STATUS -eq "0" ]; do
  if [ -f $FILENAME ]; then
    STATUS=1
    cp -f "$BASEDIR"/templates/rails/database.yml ./config/
  else
    { sleep 1s & } 2>/dev/null
  fi
done

echo 'All done here. Your app is almost ready!'
