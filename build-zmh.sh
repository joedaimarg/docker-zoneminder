#!/bin/bash
# NOTE: make sure to chmod a+x build-zmh.sh

# Installer script name
FILE=do_debian_package.sh

if test -f "$FILE"; then
  echo "$FILE exists. Script will now continue."
else 
  # Grab the package installer script
  wget https://raw.githubusercontent.com/joedaimarg/zoneminder/zmh/utils/$FILE
  chmod a+x $FILE
fi

# Update the system
sudo apt-get update

# Build the latest master snapshot
./$FILE --snapshot=NOW --branch=zmh-dev --type=fork --fork=joedaimarg --interactive=no

# Build image
docker build --build-arg PASS_CACHE="$(date)" -t tbmzmh -f Dockerfile .

# Clean up build
./do_debian_package.sh clean && rm -rf zoneminder_* && rm -rf do_debian_package.sh* && rm -rf zoneminder-d*
