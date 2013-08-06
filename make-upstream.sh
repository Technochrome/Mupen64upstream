#!/bin/sh

#  make-upstream.sh
#  mupen64plus-upstream
#
#  Created by Rovolo on 8/2/13.
#  Copyright (c) 2013 Rovolo. All rights reserved.

export PATH=$PATH:/opt/local/bin/

for proj in 'rsp-hle' 'audio-sdl' 'video-rice' 'video-arachnoid' 'core' 'rsp-hle'; do
	echo "Building $proj"
	cd $proj/projects/unix
	pwd
	make install DEBUG=1 APIDIR=$SRCROOT/core/src/api PREFIX=$SRCROOT/-products
	rm -rf _obj *.dylib
	cd $SRCROOT
done