#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"). You may
# only use this file in accordance with the terms of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright 2011-2013, EveryCity Ltd. All rights reserved.
#

BUILD_BITS=32
include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		libffi
COMPONENT_VERSION=	3.4.4
COMPONENT_PROJECT_URL=	http://sourceware.org/libffi/
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	\
    sha256:d66c56ad259a82cf2a9dfc408b32bf5da52371500b84745f7fb8b645712df676
COMPONENT_ARCHIVE_URL=	https://github.com/libffi/libffi/releases/download/v$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)
COMPONENT_FMRI=		library/$(COMPONENT_NAME)/32
COMPONENT_LICENSE_FILE= LICENSE
COMPONENT_LICENSE=	MIT
COMPONENT_SUMMARY=	Foreign Function Interface Library
COMPONENT_CLASSIFICATION= org.opensolaris.category.2008:System/Libraries

include $(WS_MAKE_RULES)/common.mk

CFLAGS += -DFFI_MMAP_EXEC_WRIT=1

CONFIGURE_OPTIONS  +=		--disable-static
CONFIGURE_OPTIONS  +=		--enable-shared
CONFIGURE_OPTIONS  +=		--disable-raw-api
CONFIGURE_OPTIONS  +=		--disable-dependency-tracking

test:           $(NO_TEST)

# Auto-generated dependencies
REQUIRED_PACKAGES += system/library
