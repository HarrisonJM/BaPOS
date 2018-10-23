#!/bin/bash

# This script should seve to allow us to just run it and it'll take care of some of the build steps 
# we've been taking to get things working and built. As we progress, the repo will contain files.
# These files will either be "in place" or just in the root of the project and we'll use this script to copy them into place.
# Somehow. Chances are that we'll have to find a way around licensing and what not (or just repackage a few tarballs ;)
# But I don't envisage this being too much of an issue...

LINUXNAME=linux-4.14.78
STARKLROOTDIR=starkl-4kopen-v1.0.0/

# Download the linux version we wish to use
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/"$LINUXNAME".tar.xz

# unzip the archive
xz -d "$LINUXNAME".tar.xz
if [[ "$?" -ne 0]]; then
    echo "If we reach here the extraction failed"
    exit 1;
fi

# untar the tarball
tar -xf "$LINUX_NAME".tar
if [[ "$?" -ne 0]]; then
    echo " The untarring has failed"
    exit 1;
fi

# move the source to the tarballs folder
mv $LINUXNAME "$STARKLROOTDIR/tarballs"

# cd into starkl
cd "$STARKLROOTDIR"

# run the starkl/build root config
make menuconfig


echo "Waiting 5s for sanity"
sleep 5

make

