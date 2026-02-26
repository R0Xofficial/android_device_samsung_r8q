#
# Copyright (C) 2022-2025 The Android Open Source Project
# Copyright (C) 2022-2025 The TeamWin Recovery Project
# Copyright (C) 2025 OrangeFox Recovery Project
#

PRODUCT_RELEASE_NAME := r8q

$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

$(call inherit-product, vendor/twrp/config/common.mk)

$(call inherit-product, device/samsung/r8q/device.mk)

PRODUCT_PACKAGES += \
    charger_res_images

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/samsung/r8q/recovery/root,recovery/root)

PRODUCT_NAME := twrp_r8q
PRODUCT_DEVICE := r8q
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G781B
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.recovery.ui.margin_height=88
