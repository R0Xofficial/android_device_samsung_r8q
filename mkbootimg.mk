#
# Copyright (C) 2022-2025 The TeamWin Recovery Project
# Copyright (C) 2025 OrangeFox Recovery Project
#

MKBOOTIMG := $(HOST_OUT_EXECUTABLES)/mkbootimg

$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(BOOTIMAGE_EXTRA_DEPS)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) echo -n "SEANDROIDENFORCE" >> $@
	@echo "Made boot image: $@"

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recovery_ramdisk) $(recovery_kernel) $(RECOVERYIMAGE_EXTRA_DEPS) $(AVBTOOL)
	@echo "----- Making recovery image ------"
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	@echo "----- Lying about SEAndroid state to Samsung bootloader -----"
	$(hide) echo -n "SEANDROIDENFORCE" >> $@
	@echo "----- Signing with AVB Tool -----"
	$(hide) $(AVBTOOL) add_hash_footer --image $@ --partition_size $(BOARD_RECOVERYIMAGE_PARTITION_SIZE) --partition_name recovery --algorithm $(BOARD_AVB_RECOVERY_ALGORITHM) --key $(BOARD_AVB_RECOVERY_KEY_PATH)
	@echo "Made recovery image: $@"
