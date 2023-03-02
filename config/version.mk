STAG_DATE_YEAR := $(shell date -u +%Y)
STAG_DATE_MONTH := $(shell date -u +%m)
STAG_DATE_DAY := $(shell date -u +%d)
STAG_DATE_HOUR := $(shell date -u +%H)
STAG_DATE_MINUTE := $(shell date -u +%M)
STAG_BUILD_DATE_UTC := $(shell date -d '$(STAG_DATE_YEAR)-$(STAG_DATE_MONTH)-$(STAG_DATE_DAY) $(STAG_DATE_HOUR):$(STAG_DATE_MINUTE) UTC' +%s)
STAG_BUILD_DATE := $(STAG_DATE_YEAR)$(STAG_DATE_MONTH)$(STAG_DATE_DAY)-$(STAG_DATE_HOUR)$(STAG_DATE_MINUTE)

STAG_PLATFORM_VERSION := 14.0

STAG_VERSION := StagOS_$(STAG_BUILD)-$(STAG_PLATFORM_VERSION)-$(STAG_BUILD_DATE)
STAG_VERSION_PROP := fourteen

# Signing
ifeq (user,$(TARGET_BUILD_VARIANT))
ifneq (,$(wildcard .android-certs/releasekey.pk8))
PRODUCT_DEFAULT_DEV_CERTIFICATE := .android-certs/releasekey
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.oem_unlock_supported=1
endif
ifneq (,$(wildcard .android-certs/verity.pk8))
PRODUCT_VERITY_SIGNING_KEY := .android-certs/verity
endif
ifneq (,$(wildcard .android-certs/otakey.x509.pem))
PRODUCT_OTA_PUBLIC_KEYS := .android-certs/otakey.x509.pem
endif
endif
