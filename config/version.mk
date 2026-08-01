PRODUCT_VERSION_MAJOR = 16
PRODUCT_VERSION_MINOR = 0

# Increase EVO Version with each major release.
EVO_VERSION_BASE := 11.10
EVO_BUILD_TYPE ?= Unofficial

ifeq ($(EVO_BUILD_TYPE),Official)
else ifeq ($(EVO_BUILD_TYPE),Unofficial)
else
$(error EVO_BUILD_TYPE must be Official or Unofficial. Current value: $(EVO_BUILD_TYPE))
endif

ifeq ($(WITH_GMS),true)
EVO_VERSION := $(EVO_VERSION_BASE)
else
EVO_VERSION := $(EVO_VERSION_BASE)-Vanilla
endif

# Internal version
LINEAGE_VERSION := EvolutionX-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)-$(EVO_VERSION)-$(EVO_BUILD_TYPE)

# Display version
LINEAGE_DISPLAY_VERSION := v$(EVO_VERSION)-$(shell date +%Y%m%d)

# Evolution X version properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.evolution.build.type=$(EVO_BUILD_TYPE) \
    ro.evolution.build.version=$(LINEAGE_VERSION) \
    ro.evolution.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.evolution.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(EVO_VERSION)
