#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/shiva

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.usbconfigfs=true androidboot.selinux=permissive buildvariant=eng sys.usb.configfs=1
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/xiaomi/shiva
TARGET_KERNEL_CONFIG := shiva_defconfig
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Selinux
BOARD_SEPOLICY_VERS := 29.0.3
SEPOLICY_IGNORE_NEVERALLOWS := true
SELINUX_IGNORE_NEVERALLOWS := true

# Crypto
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true

# System as root
BOARD_SUPPRESS_SECURE_ERASE := true

# Platform
TARGET_BOARD_PLATFORM := mt6768
TARGET_IS_64_BIT := true
BOARD_HAS_MTK_HARDWARE := true
BOARD_USES_MTK_HARDWARE := true
MTK_HARDWARE := true
TARGET_BOOTLOADER_BOARD_NAME := mt6768
TARGET_BOARD_PLATFORM_GPU := Mali-G52 MC2

# Assert
TARGET_OTA_ASSERT_DEVICE := shiva

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 452984832
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 114601984000
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 16777216
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 220270592
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 220270592
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 220270592

# Dynamic Partition
BOARD_SUPER_PARTITION_SIZE := 6012043264
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 6012043264
BOARD_MAIN_PARTITION_LIST := \
    product \
    system \
    vendor

BOARD_SUPER_PARTITION_ERROR_LIMIT := 6012043264

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true

TW_Y_OFFSET := 80
TW_H_OFFSET := -80
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_USES_MKE2FS := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_FORCE_USE_BUSYBOX := true
TW_EXCLUDE_TWRPAPP := true

TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_SKIP_COMPATIBILITY_CHECK := true

# NOTE - Dont use '-' or blank spaces in flag values , otherwise it will create build errors or other bugs in recovery (Excluding SHRP_PATH,SHRP_REC). 
# Path of your SHRP Tree
SHRP_PATH := device/xiaomi/shiva
# Maintainer name *
SHRP_MAINTAINER := zubairk22
# Device codename *
SHRP_DEVICE_CODE := shiva
# Recovery Type (It can be treble,normal,SAR) [Only for About Section] *
SHRP_REC_TYPE := treble
# Recovery Type (It can be A/B or A_only) [Only for About Section] *
SHRP_DEVICE_TYPE := A_only
# Notch
SHRP_NOTCH := true
# EDL
SHRP_EDL_MODE := 1
SHRP_INTERNAL := /sdcard
SHRP_EXTERNAL := /external_sd
SHRP_OTG := /usb-otg
SHRP_FLASH := 1
# Path
SHRP_REC := /dev/block/platform/bootdevice/by-name/recovery
# Dark Mode
SHRP_DARK := true
SHRP_LITE := true
# Magisk Addon (Safetynet fixed)
SHRP_EXTERNAL_ADDON_PATH := "device/xiaomi/shiva/addon/"
SHRP_EXTERNAL_ADDON_1_NAME := "Magisk Canary"
SHRP_EXTERNAL_ADDON_1_INFO := "Magisk With Safetynet fixed"
SHRP_EXTERNAL_ADDON_1_FILENAME := "app-debug.apk"
SHRP_EXTERNAL_ADDON_1_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_1_SUCCESSFUL_TEXT := "Flashed Magisk"
SHRP_INC_IN_REC_EXTERNAL_ADDON_1 := true
