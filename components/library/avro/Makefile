#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL)". You may
# only use this file in accordance with the terms of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright (c) 2018	cgrzemba@opencsw.org
#
include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		avro
COMPONENT_VERSION=	1.8.2
COMPONENT_PROJECT_URL=	https://avro.apache.org
COMPONENT_SUMMARY=	data serialization system
COMPONENT_FMRI=         library/avro
COMPONENT_CLASSIFICATION=       System/Libraries
COMPONENT_SRC=		$(COMPONENT_NAME)-src-$(COMPONENT_VERSION)
COMPONENT_SRC1 =		$(COMPONENT_NAME)-doc-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	\
	sha256:96941cc897e9d2da32f7d73331abac4942bd2fa9fe4b4ee4b86fef84bc24b684
COMPONENT_ARCHIVE_URL=	http://mirror.synyx.de/apache/$(COMPONENT_NAME)/$(COMPONENT_NAME)-$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)
COMPONENT_LICENSE=	Apache2
COMPONENT_LICENSE_FILE=	LICENSE.txt

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/cmake.mk
include $(WS_MAKE_RULES)/ips.mk

PATH:=$(GNUBIN):$(PATH)

COMPONENT_PRE_CMAKE_ACTION = \
	( $(CLONEY) $(SOURCE_DIR)/lang/c++ $(@D); mkdir $(@D)/build; cp $(SOURCE_DIR)/share/VERSION.txt $(@D)  )

CMAKE = echo
COMPONENT_POST_CMAKE_ACTION = (cd $(@D)/build ; $(ENV) $(CMAKE_ENV) \
                cmake $(CMAKE_OPTIONS) ..)

CMAKE_OPTIONS += -G"Unix Makefiles"
CMAKE_OPTIONS += -DCMAKE_BUILD_TYPE=Release

COMPONENT_BUILD_GMAKE_ARGS += -C build
COMPONENT_INSTALL_ARGS += -C build

# common targets
build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

test:		$(TEST_32_and_64)
# Auto-generated dependencies
REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += system/library/boost
REQUIRED_PACKAGES += system/library/g++-6-runtime
REQUIRED_PACKAGES += system/library/gcc-6-runtime
