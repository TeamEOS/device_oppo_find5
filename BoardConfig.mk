#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Board Info
TARGET_SPECIFIC_HEADER_PATH := device/oppo/find5/include

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
BOARD_VENDOR := oppo

# Kernel
TARGET_ARM_EABI_GCC_VERSION := 4.6-aosp
TARGET_KERNEL_CONFIG := find5_defconfig
TARGET_KERNEL_SOURCE := kernel/oppo/find5
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=find5 lpj=67677 user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000

# Recovery
TARGET_RECOVERY_FSTAB := device/oppo/find5/configs/fstab.find5
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/oppo/find5/recovery/recovery_keys.c
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_HAS_NO_SELECT_BUTTON := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824

BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 36
BOARD_WANTS_EMMC_BOOT := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/oppo/find5/bluetooth

# Bootloader
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOOTLOADER_BOARD_NAME := find5
TARGET_BOOTLOADER_NAME=find5
TARGET_BOARD_INFO_FILE := device/oppo/find5/board-info.txt
TARGET_NO_BOOTLOADER := true

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

# Qcom
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true

# Display
BOARD_EGL_CFG := device/oppo/find5/configs/egl.cfg
TARGET_QCOM_DISPLAY_VARIANT := caf
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
# needed for latest CAF kernel
COMMON_GLOBAL_CFLAGS += -DNEW_ION_API 
TARGET_USES_C2D_COMPOSITION := true

BOARD_USES_SECURE_SERVICES := true

BOARD_LIB_DUMPSTATE := libdumpstate.find5

# GPS
BOARD_HAVE_NEW_QC_GPS := true
#The below will be needed if we ever want to build GPS HAL from source
#TARGET_PROVIDES_GPS_LOC_API := true
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
#TARGET_NO_RPC := true

# Camera
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK -DQCOM_BSP_CAMERA_ABI_HACK
USE_DEVICE_SPECIFIC_CAMERA := true

TARGET_RELEASETOOLS_EXTENSIONS := device/oppo/find5

BOARD_CHARGER_ENABLE_SUSPEND := true

# Audio
BOARD_USES_ALSA_AUDIO:= true
TARGET_QCOM_AUDIO_VARIANT := caf
BOARD_HAVE_LOW_LATENCY_AUDIO := true
TARGET_QCOM_MEDIA_VARIANT := caf
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
BOARD_USES_SEPERATED_VOICE_SPEAKER := true

-include vendor/oppo/find5/BoardConfigVendor.mk

# dont build docs
DISABLE_DROIDDOC := true 
