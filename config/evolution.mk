# PIF values
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.pihooks_MANUFACTURER?=Google \
    persist.sys.pihooks_BRAND?=google \
    persist.sys.pihooks_MODEL?=Pixel 6a \
    persist.sys.pihooks_FINGERPRINT?=google/bluejay_beta/bluejay:CANARY/ZP11.260918.007/16484274:user/release-keys \
    persist.sys.pihooks_PRODUCT?=bluejay_beta \
    persist.sys.pihooks_DEVICE?=bluejay \
    persist.sys.pihooks_ID?=ZP11.260918.007 \
    persist.sys.pihooks_SECURITY_PATCH?=2026-10-05 \
    persist.sys.pihooks_DEVICE_INITIAL_SDK_INT?=32

# Evolution X packages
PRODUCT_PACKAGES += \
    EvoEgg

PRODUCT_PACKAGES += \
    Updater

ifeq ($(WITH_GMS),false)
PRODUCT_PACKAGES += \
    UpdaterVanillaOverlay
endif

ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
PRODUCT_PACKAGES += \
    FaceUnlock

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

# Cloned app exemption
PRODUCT_COPY_FILES += \
    vendor/lineage/prebuilt/common/etc/sysconfig/preinstalled-packages-platform-evolution-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-platform-evolution-product.xml

# Private keys
ifeq ($(EVO_BUILD_TYPE),Official)
include vendor/evolution-priv/keys/keys.mk
else
-include vendor/evolution-priv/keys/keys.mk
endif
