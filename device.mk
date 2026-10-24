#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from nubia sm8650-common
$(call inherit-product, device/nubia/sm8650-common/common.mk)

DEVICE_PATH := device/nubia/cerro

# Audio
ifeq ($(TARGET_KERNEL_MAINLINE),true)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/mixer_paths_pineapple_mtp_mainline.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_pineapple/mixer_paths_pineapple_mtp.xml \
    vendor/nubia/cerro/proprietary/vendor/firmware/aw882xx_acf.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/firmware/aw882xx_acf.bin
else
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/mixer_paths_pineapple_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_pineapple/mixer_paths_pineapple_mtp.xml
endif

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Camera
ifeq ($(TARGET_KERNEL_MAINLINE),true)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/camera/camxoverridesettings_mainline.txt:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camxoverridesettings.txt
endif

# Overlays
PRODUCT_PACKAGES += \
    SettingsProviderResCerro

# Secure element
PRODUCT_PACKAGES += \
    android.hardware.secure_element-service.thales

ifeq ($(TARGET_KERNEL_MAINLINE),true)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/libse-gto-hal_mainline.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libse-gto-hal.conf
else
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/libse-gto-hal.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libse-gto-hal.conf
endif

# Slider
PRODUCT_PACKAGES += \
    LineageSlider \
    vendor.lineage.slider-service.default

# Inherit from proprietary targets
$(call inherit-product, vendor/nubia/cerro/cerro-vendor.mk)
