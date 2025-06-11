# PIF values
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.pihooks_MANUFACTURER?=Google \
    persist.sys.pihooks_BRAND?=google \
    persist.sys.pihooks_PRODUCT?=panther_beta \
    persist.sys.pihooks_DEVICE?=panther \
    persist.sys.pihooks_ID?=BP31.250523.010 \
    persist.sys.pihooks_RELEASE?=12 \
    persist.sys.pihooks_SECURITY_PATCH?=2025-06-05 \
    persist.sys.pihooks_DEVICE_INITIAL_SDK_INT?=21 \
    persist.sys.pihooks_SDK_INT?=32

PRODUCT_BUILD_PROP_OVERRIDES += \
    PihooksGmsFp="google/panther_beta/panther:16/BP31.250523.010/13667654:user/release-keys" \
    PihooksGmsModel="Pixel 7"

# Evolution X packages
PRODUCT_PACKAGES += \
    EvoEgg \
    GameSpace
#    OmniJaws \
#    OmniStyle

# BtHelper
PRODUCT_PACKAGES += \
    BtHelper

PRODUCT_PACKAGES += \
    Updater

ifeq ($(WITH_GMS),false)
PRODUCT_PACKAGES += \
    UpdaterVanillaOverlay
endif

# Enable blur
TARGET_ENABLE_BLUR ?= true
ifeq ($(TARGET_ENABLE_BLUR),true)
PRODUCT_SYSTEM_PROPERTIES += \
    ro.custom.blur.enable=true
else
PRODUCT_SYSTEM_PROPERTIES += \
    ro.custom.blur.enable=false
endif

PRODUCT_SYSTEM_PROPERTIES += ro.surface_flinger.supports_background_blur=1

# Face Unlock
ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
PRODUCT_PACKAGES += \
    FaceUnlock

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/android.hardware.biometrics.face.xml
endif

# DeviceAsWebcam
ifeq ($(TARGET_BUILD_DEVICE_AS_WEBCAM), true)
    PRODUCT_PACKAGES += \
        DeviceAsWebcam

    PRODUCT_VENDOR_PROPERTIES += \
        ro.usb.uvc.enabled=true
endif

# Cloned app exemption
PRODUCT_COPY_FILES += \
    vendor/lineage/prebuilt/common/etc/sysconfig/preinstalled-packages-platform-evolution-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-platform-evolution-product.xml

# ColumbusService
#ifneq ($(TARGET_SUPPORTS_QUICK_TAP),false)
#PRODUCT_PACKAGES += \
#    ColumbusService
#endif

# Disable async MTE on a few processes
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.arm64.memtag.app.com.android.se=off \
    persist.arm64.memtag.app.com.google.android.bluetooth=off \
    persist.arm64.memtag.app.com.android.nfc=off \
    persist.arm64.memtag.process.system_server=off

# Private keys
ifeq ($(EVO_BUILD_TYPE),Official)
include vendor/evolution-priv/keys/keys.mk
else
-include vendor/evolution-priv/keys/keys.mk
endif

BYPASS_CHARGE_SUPPORTED ?= false
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.battery_bypass_supported=$(BYPASS_CHARGE_SUPPORTED)
