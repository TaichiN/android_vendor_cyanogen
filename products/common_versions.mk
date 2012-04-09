PRODUCT_VERSION_MAJOR = 7
PRODUCT_VERSION_MINOR = 2
PRODUCT_VERSION_MAINTENANCE = 0-RC1

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID="Gingerbread GWK74 - Gigglebread"

ifdef CYANOGEN_NIGHTLY
    CMVERSION := $(PRODUCT_VERSION_MAJOR)-$(shell date +%Y%m%d)-NIGHTLY-$(CM_BUILD)
    MODVERSION := CyanogenMod-$(PRODUCT_VERSION_MAJOR)-NIGHTLY-$(shell date +%Y%m%d)-$(PRODUCT_RELEASE_NAME)
else ifdef CYANOGEN_KANG
    CMVERSION := $(PRODUCT_VERSION_MAJOR)-$(shell date +%Y%m%d)-UNOFFICIAL-$(CM_BUILD)
    MODVERSION := CyanogenMod-$(PRODUCT_VERSION_MAJOR)-UNOFFICIAL-$(shell date +%Y%m%d)-$(PRODUCT_RELEASE_NAME)
else
    ifdef CYANOGEN_RELEASE
        CMVERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(CM_BUILD)
    else
        CMVERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(CM_BUILD)-UNOFFICIAL
    endif
    MODVERSION := $(CMVERSION)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.cm.version=$(CMVERSION) \
    ro.modversion=$(MODVERSION)
