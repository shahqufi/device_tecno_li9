#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from device makefile.
$(call inherit-product, device/tecno/li9/device.mk)

PRODUCT_DEVICE := li9
PRODUCT_NAME := lineage_li9
PRODUCT_BRAND := Tecno
PRODUCT_MODEL := Tecno Pova 6 Pro
PRODUCT_MANUFACTURER := tecno

# Boot animation
TARGET_SCREEN_HEIGHT := 2424
TARGET_SCREEN_WIDTH := 1080

PRODUCT_GMS_CLIENTID_BASE := android-transsion

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceName=LI9 \
    BuildFingerprint=TECNO/LI9-OP/TECNO-LI9:14/UP1A.231005.007/240130V1177:user/release-keys
