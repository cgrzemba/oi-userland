#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source.  A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright 2015 Alexander Pyhalov
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME= faac
COMPONENT_VERSION= 1.29
COMPONENT_REVISION= 0
COMPONENT_SUMMARY= Reference encoder and encoding library for MPEG2/4 AAC
# COMPONENT_SRC= $(COMPONENT_NAME)-$(subst .,_,$(COMPONENT_VERSION))
COMPONENT_SRC= $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE= $(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH= \
#	sha256:adc387ce588cca16d98c03b6ec1e58f0ffd9fc6eadb00e254157d6b16203b2d2  
COMPONENT_ARCHIVE_URL= \
  http://downloads.sourceforge.net/project/faac/faac-src/$(COMPONENT_NAME)-$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)
COMPONENT_PROJECT_URL = http://www.audiocoding.com/faac.html
COMPONENT_LICENSE = LGPLv2
COMPONENT_LICENSE_FILE = COPYING
COMPONENT_CLASSIFICATION = Applications/Sound and Video
COMPONENT_FMRI = audio/faac

include $(WS_MAKE_RULES)/encumbered.mk
include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/configure.mk
include $(WS_MAKE_RULES)/ips.mk

# Missing files in build dir for configure without this.
COMPONENT_PRE_CONFIGURE_ACTION = ( \
	cd  $(SOURCE_DIR) && autoreconf -i; \
	$(CLONEY) $(SOURCE_DIR) $(@D); \
	)

CONFIGURE_SCRIPT = $(@D)/configure

CFLAGS += $(CPP_LARGEFILES)

# CONFIGURE_OPTIONS += --disable-static
CONFIGURE_OPTIONS += --enable-drm
CONFIGURE_OPTIONS += --with-mp4v2

build: $(BUILD_32_and_64)

install: $(INSTALL_32_and_64)

# Auto-generated dependencies
REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += $(GXX_RUNTIME_PKG)
REQUIRED_PACKAGES += $(GCC_RUNTIME_PKG)
REQUIRED_PACKAGES += system/library/math
