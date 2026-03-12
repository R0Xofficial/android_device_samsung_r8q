#
#	PitchBlack Recovery Project - vendorsetup.sh
# 	Device: r8q (Galaxy S20 FE 5G / 4G Snapdragon)
#

FDEVICE="r8q"

pbrp_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      PB_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && PB_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$PB_BUILD_DEVICE" ]; then
   pbrp_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$PB_BUILD_DEVICE" = "$FDEVICE" ]; then
    export ALLOW_MISSING_DEPENDENCIES=true
    export LC_ALL=C
    
    export PB_DEVICE_MODEL="r8q"
    export PB_MAINTAINER="R0Xofficial"
    export PB_BUILD_TYPE="Unofficial"
    export PB_MAIN_VERSION="4.0"

    export PB_RECOVERY_INSTALL_PARTITION="/dev/block/bootdevice/by-name/recovery"
    
    export PB_USE_MAGISKBOOT=1
    export PB_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
    export PB_DONT_PATCH_ENCRYPTED_DEVICE=1
    
    export PB_SCREEN_H=2400
    export PB_STATUS_H=72
    export PB_HIDE_NOTCH=1
    
    export PB_FLASHLIGHT_THEME_SUPPORT=1
    export PB_SURVIVAL_FOLDER="/data/media/PB"
    export PB_DISABLE_APP_MANAGER=1
    export PB_DISABLE_DEFAULT_DM_VERITY=true
    export PB_TORCH_PATH='"/sys/class/camera/flash/rear_flash"'
    export PB_TORCH_MAX_BRIGHTNESS=1
    
    export PB_USE_NANO_EDITOR=1
    export PB_USE_TAR_BINARY=1
    export PB_USE_SED_BINARY=1
    export PB_USE_XZ_UTILS=1
fi
