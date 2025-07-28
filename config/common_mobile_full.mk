# Inherit common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_mobile.mk)

PRODUCT_SIZE := full

# Apps
PRODUCT_PACKAGES += \
    Camelot \
    Profiles \
    Recorder \
    Seedvault
#    Etar

ifeq ($(WITH_GMS),false)
PRODUCT_PACKAGES += \
    Twelve
endif

ifneq ($(TARGET_BUILD_APERTURE_CAMERA),true)
PRODUCT_PACKAGES += \
    Aperture
endif

ifeq ($(WITH_GMS),false)
ifneq ($(TARGET_EXCLUDES_AUDIOFX),true)
PRODUCT_PACKAGES += \
    AudioFX
endif
endif

# Extra cmdline tools
PRODUCT_PACKAGES += \
    unrar \
    zstd

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/lineage/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/lineage/overlay/dictionaries
