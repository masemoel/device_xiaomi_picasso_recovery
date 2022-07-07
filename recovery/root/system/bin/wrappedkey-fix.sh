#!/system/bin/sh
#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2022-2023 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

# Deal with situations where the ROM doesn't support wrappedkey encryption;
# In such cases, remove the wrappedkey flag from the fstab file

file_getprop() {
  local F=$(grep -m1 "^$2=" "$1" | cut -d= -f2);
  echo $F | sed 's/ *$//g';
}

# NOTE: this function is designed for Android 13 ROMs which, at the time of writing this script,
# don't support wrappedkey; if any of them starts supporting wrappedkey, the function will need to be amended.
fix_unwrap_decryption() {
local D=/FFiles/temp/system_prop;
local S=/dev/block/bootdevice/by-name/system;
local F=/FFiles/temp/build.prop;
local LOGF=/tmp/recovery.log;
local found=0;
    mkdir -p $D;
    cd /FFiles/temp/;
    mount $S $D;
    cp $D/system/build.prop $F;
    umount $D;
    rmdir $D;

    if [ ! -e $F ]; then
    	echo "$F does not exist. Quitting." >> $LOGF;
    	return;
    fi

    local SDK=$(file_getprop "$F" "ro.build.version.sdk");
    [ -z "$SDK" ] && SDK=$(file_getprop "$F" "ro.system.build.version.sdk");
    [ -z "$SDK" ] && SDK=$(file_getprop "$F" "ro.vendor.build.version.sdk");
    [ -z "$SDK" ] && SDK=32; # default to A12

    # Check for Android 13+ SDK; assume that all A12.1 ROMs use wrappedkey
    if [ $SDK -lt 33 ]; then
	echo "ROM SDK=\"$SDK\". Continuing with the default fstab" >> $LOGF;
	rm -f $F;
	return;
    else
	found=0; # assume for now that all A13 ROMs use wrappedkey

	# except this (for now)
	if [ -n "$(grep ro.spark. $F)" ]; then
	   found=1;
	fi
    fi

    if [ "$found" = "1" ]; then
       echo "I:OrangeFox: this ROM does not support wrappedkey. Removing the wrappedkey flags from the fstab." >> $LOGF;
       cp /system/etc/recovery-no-wrappedkey.fstab /system/etc/recovery.fstab;
    else
       echo "I:OrangeFox: this ROM supports wrappedkey. Continuing with the default fstab." >> $LOGF;
    fi

    rm -f $F;
}

#
fix_unwrap_decryption;
exit 0;
