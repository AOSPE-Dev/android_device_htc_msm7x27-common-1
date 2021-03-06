# Copyright (C) 2013 The CyanogenMod Project
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

TARGET_SPECIFIC_HEADER_PATH := device/htc/msm7x27-common/include

# Make sure this folder exists so display stuff doesn't fail
$(shell mkdir -p $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/)

# inherit from common msm7x27 Recovery
-include device/htc/msm7x27-common/recovery/BoardConfigCommon.mk


# CPU
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := arm11
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_BOARD_PLATFORM := msm7x27
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# CFLAGS
COMMON_GLOBAL_CFLAGS += -DTARGET_MSM7x27
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK -DANCIENT_GL
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
COMMON_GLOBAL_CFLAGS += -DMISSING_GRALLOC_BUFFERS
COMMON_GLOBAL_CFLAGS += -DQCOM_MISSING_PIXEL_FORMATS
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
#COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_COMPAT

### Board config
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

### Kernel
TARGET_KERNEL_SOURCE := kernel/htc/msm7227
TARGET_KERNEL_CONFIG := marvel_defconfig

### USB Mass Storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file

### Wifi related defines
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WLAN_DEVICE := bcm4329
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/firmware/fw_bcm4329.bin nvram_path=/proc/calibration iface_name=wlan0"
WIFI_DRIVER_MODULE_NAME := "bcm4329"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcm4329/parameters/firmware_path"
BOARD_WLAN_DEVICE_REV := bcm4329
WIFI_BAND := 802_11_ABG

### Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/msm7x27-common/bluetooth/include
BOARD_BLUEDROID_VENDOR_CONF := device/htc/msm7x27-common/bluetooth/vnd_msm7x27.txt

### QCOM
TARGET_QCOM_LEGACY_OMX := true
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_USE_QCOM_PMEM := true

# Adreno
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_EGL_CFG := device/htc/msm7x27-common/egl.cfg

### CPU/Graphics
TARGET_QCOM_DISPLAY_VARIANT := legacy
TARGET_QCOM_MEDIA_VARIANT := legacy
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
USE_OPENGL_RENDERER := true
BOARD_USE_ADRENO_200_GPU := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_SF_BYPASS := false
TARGET_HAVE_BYPASS := false
TARGET_USES_OVERLAY := false
TARGET_QCOM_HDMI_OUT := false
TARGET_GRALLOC_USES_ASHMEM := false
TARGET_USES_GENLOCK := true
TARGET_NO_HW_VSYNC := true
BOARD_EGL_NEEDS_LEGACY_FB := true
BOARD_NO_RGBX_8888 := true


### Camera
BOARD_CAMERA_5MP := true
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
USE_CAMERA_STUB := false

### Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_PREBUILT_LIBAUDIO := false
BOARD_USES_QCOM_AUDIO_VOIPMUTE := true
BOARD_USES_QCOM_AUDIO_RESETALL := true
BOARD_USES_AUDIO_LEGACY := false
TARGET_PROVIDES_LIBAUDIO := true
BOARD_COMBO_DEVICE_SUPPORTED := true

### Lights
TARGET_PROVIDES_LIBLIGHT := true

### Bootanimation
TARGET_BOOTANIMATION_USE_RGB565 := true

###GPS moved here temporarily
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x27
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 20000

### RIL
BOARD_USES_LEGACY_RIL := true
BOARD_USE_NEW_LIBRIL_HTC := true

## Minimal fonts
SMALLER_FONT_FOOTPRINT := true

### Dalvik
WITH_JIT := true


### Webkit and browser
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes
TARGET_FORCE_CPU_UPLOAD := true
JS_ENGINE := v8
HTTP := chrome
ENABLE_JSC_JIT := true
