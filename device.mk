#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from nubia sm8650-common
$(call inherit-product, device/nubia/sm8650-common/common.mk)

DEVICE_PATH := device/nubia/cerro

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/mixer_paths_pineapple_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_pineapple/mixer_paths_pineapple_mtp.xml

ifeq ($(TARGET_KERNEL_MAINLINE),true)
PRODUCT_COPY_FILES += \
    vendor/nubia/cerro/proprietary/vendor/firmware/aw882xx_acf.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/firmware/aw882xx_acf.bin
endif

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Overlays
PRODUCT_PACKAGES += \
    SettingsProviderResCerro

# Slider
PRODUCT_PACKAGES += \
    LineageSlider \
    vendor.lineage.slider-service.default

# Inherit from proprietary targets
$(call inherit-product, vendor/nubia/cerro/cerro-vendor.mk)
