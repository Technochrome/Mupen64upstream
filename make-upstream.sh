#!/bin/sh

#  make-upstream.sh
#  mupen64plus-upstream
#
#  Created by Rovolo on 8/2/13.
#  Copyright (c) 2013 Rovolo. All rights reserved.

export PATH=$PATH:/opt/local/bin/
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/opt/local/include
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/opt/local/include

INSTALL_OPTIONS="DEBUG=1 APIDIR=$SRCROOT/core/src/api PREFIX=$SRCROOT/-products NO_SRC=1"

for proj in 'video-glide64' 'video-arachnoid' 'rsp-hle' 'audio-sdl' 'video-rice' 'core' 'rsp-hle'; do
	cd $proj/projects/unix
	if [ "$ACTION" == "clean" ]; then
		make clean $INSTALL_OPTIONS
	else # build
		echo "Building $proj"
		make install $INSTALL_OPTIONS
	fi
	cd $SRCROOT
done