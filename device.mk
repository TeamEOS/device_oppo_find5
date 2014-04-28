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

$(call inherit-product, vendor/oppo/find5/find5-vendor.mk)

DEVICE_PACKAGE_OVERLAYS := device/oppo/find5/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Config scripts
PRODUCT_PACKAGES += \
    init.bbv.sh \
    init.crda.sh \
    init.find5.bt.sh \
    init.qcom.mdm_links.sh \
    init.qcom.modem_links.sh \
    init.qcom.post_fs.sh \
    init.qcom.usb.sh \
    init.qcom.wifi.sh

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.find5 \
    init.find5.rc \
    init.find5.usb.rc \
    ueventd.find5.rc

# Showp1984’s perf edits
PRODUCT_PACKAGES += \
    init.bricked.sh

# Recovery
#PRODUCT_PACKAGES += \
#    init.recovery.find5.rc \
#    twrp.fstab

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/snd_soc_msm_2x_Fusion3:system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3

PRODUCT_PACKAGES += \
    alsa.msm8960 \
    audio_policy.msm8960 \
    audio.primary.msm8960 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler

PRODUCT_PACKAGES += \
    charger_res_images \
    charger

PRODUCT_PACKAGES += \
    Find5Settings \
    power.find5
    
# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs \
    nano

# Keystore
#PRODUCT_PACKAGES += \
#    keystore.msm8960

PRODUCT_PACKAGES += \
    libgenlock \
    liboverlay \
    hwcomposer.msm8960 \
    gralloc.msm8960 \
    copybit.msm8960 \
    memtrack.msm8960 \
    camera-wrapper.msm8960

PRODUCT_PACKAGES += \
    lights.msm8960 \
    lights.find5

PRODUCT_PACKAGES += \
    libmm-omxcore \
    libdivxdrmdecrypt \
    libOmxVdec \
    libOmxVenc \
    libOmxCore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libstagefrighthw \
    libc2dcolorconvert \
    libdashplayer

PRODUCT_PACKAGES += \
    bdAddrLoader \
    hci_qcomm_init

PRODUCT_PACKAGES += \
    hostapd \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PACKAGES += \
    wcnss_service \
    crda \
    regulatory.bin \
    linville.key.pub.pem \
    libwfcu \
    conn_init \
    WCNSS_qcom_cfg.ini \
    WCNSS_qcom_wlan_nv.bin

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni
    
# Build extra packages
PRODUCT_PACKAGES += \
    Torch \
    DSPManager \
    Email \
    Exchange \
    ZeroXBenchmark \
        
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory
    
# NFC packages
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag
    
# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

PRODUCT_COPY_FILES += \
    device/oppo/find5/wifi/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat \
    device/oppo/find5/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/oppo/find5/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin \
    device/oppo/find5/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    device/oppo/find5/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \

PRODUCT_COPY_FILES += \
    device/oppo/find5/configs/gps.conf:system/etc/gps.conf \
    device/oppo/find5/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/oppo/find5/configs/media_codecs.xml:system/etc/media_codecs.xml \
    device/oppo/find5/configs/nfcee_access.xml:system/etc/nfcee_access.xml \
    device/oppo/find5/configs/nfcee_access_debug.xml:system/etc/nfcee_access_debug.xml \
    device/oppo/find5/configs/thermald-find5.conf:system/etc/thermald.conf \
    device/oppo/find5/configs/tpupdate.rle:root/tpupdate.rle
    
PRODUCT_COPY_FILES += \
    device/oppo/find5/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    device/oppo/find5/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny \
    device/oppo/find5/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf

# Prebuilt input device calibration files
PRODUCT_COPY_FILES += \
    device/oppo/find5//idc/synaptics-rmi-ts.idc:system/usr/idc/synaptics-rmi-ts.idc
    
# Prebuilt Key Character Map Files
PRODUCT_COPY_FILES += \
    device/oppo/find5/kcm/apq8064-tabla-snd-card_Button_Jack.kcm:system/usr/keychars/apq8064-tabla-snd-card_Button_Jack.kcm \
    device/oppo/find5/kcm/hs_detect.kcm:system/usr/keychars/hs_detect.kcm \
    device/oppo/find5/kcm/keypad_8064.kcm:system/usr/keychars/keypad_8064.kcm \
    device/oppo/find5/kcm/pmic8xxx_pwrkey.kcm:system/usr/keychars/pmic8xxx_pwrkey.kcm

# Prebuilt keylayout files
PRODUCT_COPY_FILES += \
    device/oppo/find5/keylayout/apq8064-tabla-snd-card_Button_Jack.kl:system/usr/keylayout/apq8064-tabla-snd-card_Button_Jack.kl \
    device/oppo/find5/keylayout/hs_detect.kl:system/usr/keylayout/hs_detect.kl \
    device/oppo/find5/keylayout/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
    device/oppo/find5/keylayout/keypad_8064.kl:system/usr/keylayout/keypad_8064.kl \
    device/oppo/find5/keylayout/synaptics-rmi-ts.kl:system/usr/keylayout/synaptics-rmi-ts.kl \

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Showp1984’s perf edits
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    sys.perf.bricked=1
    
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480

# qcom
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.ssr=false \
    ro.qc.sdk.audio.fluencetype=fluence \
    ro.qc.sdk.gestures.camera=false \
    ro.qc.sdk.sensors.gestures=false

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.handset.mic=dmic \
    persist.audio.fluence.mode=endfire \
    persist.audio.lowlatency.rec=false \
    af.resampler.quality=4 \
    lpa.decode=false \
    tunnel.decode=false \
    tunnel.audiovideo.decode=true
      
PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-qmi-1.so

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    ro.adb.secure=0

$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# This is the find5-specific audio package
$(call inherit-product, frameworks/base/data/sounds/AudioPackage10.mk)

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Fix bad lunch inheritance
PRODUCT_NAME := full_find5
