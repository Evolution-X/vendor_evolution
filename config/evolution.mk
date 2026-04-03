# Evolution X packages
PRODUCT_PACKAGES += \
    AxThemeStore \
    BatteryStatsViewer \
    EvoEgg \
    GameSpace \
    OmniJaws \
    OmniStyle

PRODUCT_PACKAGES += \
    Updater

ifeq ($(WITH_GMS),false)
PRODUCT_PACKAGES += \
    UpdaterVanillaOverlay
endif

# LMO packages
PRODUCT_PACKAGES += \
    LMOFreeform \
    LMOFreeformSidebar

# BtHelper
PRODUCT_PACKAGES += \
    BtHelper

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
ifneq ($(TARGET_SUPPORTS_QUICK_TAP),false)
PRODUCT_PACKAGES += \
    ColumbusService
endif

# Use a generic profile based boot image by default
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_COPY_FILES += \
    art/build/boot/preloaded-classes:$(TARGET_COPY_OUT_SYSTEM)/etc/preloaded-classes

PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := \
    art/build/boot/boot-image-profile.txt

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/etc/preloaded-classes

# Enable Material Design 3 Expressive
PRODUCT_PRODUCT_PROPERTIES += is_expressive_design_enabled=true

# Private keys
ifeq ($(EVO_BUILD_TYPE),Official)
include vendor/evolution-priv/keys/keys.mk
else
-include vendor/evolution-priv/keys/keys.mk
endif

# PERF_ANIM_OVERRIDE
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.activity_anim_perf_override=$(PERF_ANIM_OVERRIDE)

ifeq ($(PERF_ANIM_OVERRIDE),true)
PRODUCT_PRODUCT_PROPERTIES += \
    debug.sf.predict_hwc_composition_strategy=0
endif

# Other ROM feature flags
PERF_ANIM_OVERRIDE ?= false
TARGET_ENABLES_IMS_OVERRIDES ?= false
TORCH_STR_SUPPORTED ?= true

PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.target_enables_ims_override=$(TARGET_ENABLES_IMS_OVERRIDES) \
    persist.sys.torch_str_support=$(TORCH_STR_SUPPORTED)
