#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2025 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#

FDEVICE="r8q"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
		export ALLOW_MISSING_DEPENDENCIES=true
		export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
		export LC_ALL="C"
		
		# OrangeFox Core Settings
		export OF_VANILLA_BUILD=1
		export FOX_BUILD_TYPE="Unofficial"
		export OF_MAINTAINER="R0Xofficial"
        export OF_MAINTAINER_AVATAR="$PWD/device/samsung/r8q/maintainer.png"

		# Samsung & Dynamic Partitions Special Fixes
		export OF_NO_SAMSUNG_SPECIAL=0
		export FOX_DYNAMIC_SAMSUNG_FIX=1
		export OF_RUN_POST_FORMAT_PROCESS=1
		export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/bootdevice/by-name/recovery"
		
		# Patching & Tools
		export OF_USE_MAGISKBOOT=1
		export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
		export OF_USE_SYSTEM_FINGERPRINT=1
		export OF_USE_TWRP_SAR_DETECT=1
		export FOX_DISABLE_APP_MANAGER=1
		
		# Display & UI Settings (Match r8q screen with punch-hole)
		export OF_SCREEN_H="2400"
		export OF_STATUS_H="88"
		export OF_STATUS_INDENT_LEFT="48"
		export OF_STATUS_INDENT_RIGHT="48"
		export OF_CLOCK_POS=1
		export OF_ALLOW_DISABLE_NAVBAR=0
		export OF_USE_GREEN_LED=0
		
		# Features
		export OF_FLASHLIGHT_ENABLE=1
		export OF_FL_PATH1="/system/flashlight"
		export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1

		# R11 core flag
		export FOX_R11=1

		# Log build variables (resembling r8s style)
		if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
		  export | grep "FOX" >> $FOX_BUILD_LOG_FILE
		  export | grep "OF_" >> $FOX_BUILD_LOG_FILE
		  export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
		  export | grep "TW_" >> $FOX_BUILD_LOG_FILE
		fi
fi
