#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit generic_ramdisk product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Dalvik VM Configuration
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

PRODUCT_PACKAGES += \
    create_pl_dev \
    create_pl_dev.recovery

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Use 64-bit audio HAL
$(call soong_config_set,android_hardware_audio,run_64bit,true)

# Audio HAL packages
PRODUCT_PACKAGES += \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.sounddose-vendor-impl \
    android.hardware.soundtrigger@2.3-impl \
    android.hardware.audio.service \

PRODUCT_PACKAGES += \
    android.hardware.bluetooth.audio-impl \
    audio.bluetooth.default \
    audio.usb.default \

PRODUCT_PACKAGES += \
    MtkInCallService \

PRODUCT_PACKAGES += \
    libaudiofoundation.vendor \
    libbluetooth_audio_session \
    libunwindstack.vendor \
    libalsautils \
    libnbaio_mono \
    libtinycompress \
    libdynproc \
    libhapticgenerator

# Audio configuration files
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth.audio@2.1-impl \
    android.hardware.bluetooth@1.1-service-mediatek \
    libbluetooth_audio_session \
    libbluetooth_audio_session_mediatek \
    libbt-vendor \
    libbluetooth_mtk \
    libbluetoothem_mtk

# Boot Control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-service \
    com.android.hardware.boot \
    android.hardware.boot-service.default_recovery

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.6.vendor \
    android.hardware.camera.device@3.6.vendor \
    camerahalserver \
    libcameracustom \
    libmtkcam_pipelinemodel \
    libcam.halsensor \
    vendor.mediatek.hardware.camera.bgservice@1.1 \
    vendor.mediatek.hardware.camera.atms@1.0

# Consumer IR
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service \
    consumerir.common

# Cgroup
PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    system/core/libprocessgroup/profiles/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-service \
    vendor.mediatek.hardware.composer_ext@1.0 \
    android.hardware.memtrack-service.mediatek 

PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@4.0-service-mediatek \
    android.frameworks.sensorservice@1.0.vendor \
    libdrm.vendor \
    libgralloc_extra \
    libgralloctypes_mtk \
    libgralloc_metadata \
    vendor.mediatek.hardware.pq@2.15-service

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey \
    android.hardware.drm@1.4.vendor

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Fastboot
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl.custom \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service-mediatek \
    vendor.mediatek.hardware.biometrics.fingerprint@2.1 \
    vendor.goodix.hardware.biometrics.fingerprint@2.1 \
    libgf_hal \
    gf_fingerprint.default

# FM Radio
PRODUCT_PACKAGES += \
    FMRadio

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1-service-mediatek \
    android.hardware.gnss.visibility_control@1.0.vendor \
    libcurl.vendor \
    libexpat.vendor \
    libmnl \
    libmtk-ril \
    libDR \
    gps.default \
    mtk_agpsd \
    mnld

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service \
    libfgauge_gm30 \
    libmtk_bsg

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.allocator@1.0.vendor \
    android.hidl.base@1.0.vendor \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder.vendor \
    vendor.mediatek.hardware.nvram@1.1-service \
    vendor.mediatek.hardware.mms@1.6-service \
    loghidlvendorservice \
    lbs_hidl_service

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# IMS
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

PRODUCT_PACKAGES += \
    libui_shim \
    libshim_sink

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1-service \
    android.hardware.keymaster@4.1.vendor \
    vendor.mediatek.hardware.keymaster_attestation@1.1-service \
    libkeymaster_messages.vendor \
    libkeymaster_portable.vendor \
    libkeymaster4.vendor \
    libkeymaster4_1support.vendor \
    libkeymaster41.vendor \
    libsoft_attestation_cert \
    libkmsetkey

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.transsion

# Linker
PRODUCT_VENDOR_LINKER_CONFIG_FRAGMENTS += \
    $(LOCAL_PATH)/configs/linker.config.json

# Media
PRODUCT_PACKAGES += \
    android.hardware.media.c2@1.2.vendor:64 \
    android.hardware.media.omx@1.0-service \
    libcodec2_hidl@1.2.vendor:64 \
    libcodec2_hidl_plugin:64 \
    libcodec2_vndk.vendor:64 \
    libeffects:64 \
    libeffectsconfig.vendor:64 \
    libavservices_minijail_vendor \
    libstagefright_softomx_plugin.vendor \
    libsfplugin_ccodec_utils.vendor \
    libcodec2_soft_common.vendor \
    libflatbuffers-cpp.vendor \
    libminijail \
    libminijail.vendor

PRODUCT_PACKAGES += \
    android.hardware.cas@1.2-service-lazy

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/seccomp,$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/media,$(TARGET_COPY_OUT_VENDOR)/etc)

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.multihal-mediatek



