#
#	PitchBlack Recovery Project - vendorsetup.sh
# 	Device: r8q (Galaxy S20 FE 5G / 4G Snapdragon)
#

export PB_DEVICE_NAME="r8q"
export PB_MAINTAINER="R0Xofficial"
export PB_BUILD_TYPE="Unofficial"

export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C

export PB_RECOVERY_INSTALL_PARTITION="/dev/block/bootdevice/by-name/recovery"
export PB_RECOVERY_BOOT_PARTITION="/dev/block/bootdevice/by-name/boot"

export PB_DISABLE_APP_MANAGER=1
export PB_USE_MAGISKBOOT=1
export PB_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
export PB_DONT_PATCH_ENCRYPTED_DEVICE=1

export PB_SCREEN_H=2400
export PB_STATUS_H=72
export PB_HIDE_NOTCH=1

export PB_USE_NANO_EDITOR=1
export PB_USE_TAR_BINARY=1
export PB_USE_SED_BINARY=1
export PB_USE_XZ_UTILS=1
