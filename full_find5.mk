#
# Copyright 2012 The Android Open Source Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from find5 device
$(call inherit-product, device/oppo/find5/device.mk)

ifneq ($(TARGET_BUILD_VARIANT),codefirex)
# Get the long list of APNs
PRODUCT_COPY_FILES := device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml
else
# Specify phone tech before including full_phone
$(call inherit-product, vendor/cfx/config/gsm.mk)

$(call inherit-product, vendor/cfx/config/common_full_phone.mk)

# Copy Bootanimation
PRODUCT_COPY_FILES += \
    vendor/cfx/prebuilt/common/bootanimation/720.zip:system/media/bootanimation.zip
endif

PRODUCT_PACKAGES += \
    Launcher3

PRODUCT_NAME := full_find5
PRODUCT_DEVICE := find5
PRODUCT_BRAND := OPPO
PRODUCT_MANUFACTURER := OPPO
PRODUCT_MODEL := Find 5
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=oppo_find5 BUILD_FINGERPRINT=google/occam/mako:4.3/JB_MR2/573038:user/release-keys PRIVATE_BUILD_DESC="occam-user 4.3 JB_MR2 573038 release-keys"

