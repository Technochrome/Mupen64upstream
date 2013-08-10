#!/bin/sh

#  make-upstream.sh
#  mupen64plus-upstream
#
#  Created by Rovolo on 8/2/13.
#  Copyright (c) 2013 Rovolo. All rights reserved.

export PATH=$PATH:/opt/local/bin/

INSTALL_OPTIONS="DEBUG=1 APIDIR=$SRCROOT/core/src/api PREFIX=$SRCROOT/-products"

for proj in 'rsp-hle' 'audio-sdl' 'video-rice' 'video-arachnoid' 'core' 'rsp-hle'; do
	cd $proj/projects/unix
	if [ "$ACTION" == "clean" ]; then
		make clean $INSTALL_OPTIONS
	else # build
		echo "Building $proj"
		make install $INSTALL_OPTIONS
	fi
	cd $SRCROOT
done