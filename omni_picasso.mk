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

# Release name
PRODUCT_RELEASE_NAME := picasso
PRODUCT_USE_DYNAMIC_PARTITIONS := true
DEVICE_PATH := device/xiaomi/picasso

# Inherit some common PitchBlack stuff.
$(call inherit-product, vendor/pb/config/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit Telephony packages
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit language packages
#$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit 64bit support
#$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := picasso
PRODUCT_NAME := omni_picasso
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi K30 5G
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_RELEASE_NAME := Redmi K30 5G

# HACK: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.product.device \
    ro.product.name \
    ro.build.product \
    ro.bootimage.build.date.utc \
    ro.build.date.utc
