#
# Copyright (C) 2022-2025 The TeamWin Recovery Project
# Copyright (C) 2025 OrangeFox Recovery Project
#

PRODUCT_SHIPPING_API_LEVEL := 29

$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

PRODUCT_USE_DYNAMIC_PARTITIONS := true

PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    android.hardware.boot@1.0-impl.recovery

PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat

TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    libdmabufheap \
    libfs_mgr_erofs

PRODUCT_TARGET_VNDK_VERSION := 30
