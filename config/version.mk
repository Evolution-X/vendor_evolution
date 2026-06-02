PRODUCT_VERSION_MAJOR = 15
PRODUCT_VERSION_MINOR = 0

# Increase EVO Version with each major release.
EVO_VERSION_BASE := 10.18
EVO_BUILD_TYPE ?= Unofficial

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
PRODUCT_SYSTEM_PROPERTIES += \
    ro.evolution.build.version=$(LINEAGE_VERSION) \
    ro.evolution.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.evolution.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(EVO_VERSION)
