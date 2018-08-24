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
# Copyright 2018 Carsten Grzemba
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		redis
COMPONENT_VERSION=	4.0.11
COMPONENT_REVISION=	2
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_FMRI=		database/redis
COMPONENT_SUMMARY=	Redis is an open source (BSD licensed), in-memory data structure store, used as a database, cache and message broker
COMPONENT_ARCHIVE_HASH=	sha256:fc53e73ae7586bcdacb4b63875d1ff04f68c5474c1ddeda78f00e5ae2eed1bbb
COMPONENT_ARCHIVE_URL=	http://download.redis.io/releases/$(COMPONENT_ARCHIVE)
COMPONENT_PROJECT_URL=	http://redis.io
COMPONENT_CLASSIFICATION=	System/Libraries
COMPONENT_LICENSE=	3 clause BSD
COMPONENT_LICENSE_FILE=	COPYING

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/justmake.mk
include $(WS_MAKE_RULES)/ips.mk

COMPONENT_BUILD_ENV += CC=gcc
COMPONENT_BUILD_ENV += OPTIMIZATION=-O3
COMPONENT_BUILD_ENV += "SHOBJ_CFLAGS=-Wall -fno-common -std=c99 -O3"
COMPONENT_BUILD_ENV += MYCFLAGS=-O3
COMPONENT_BUILD_GMAKE_ARGS += -j14
COMPONENT_TEST_ENV += CC=gcc
COMPONENT_TEST_TARGETS = test
COMPONENT_INSTALL_ENV += CC=gcc
COMPONENT_INSTALL_ARGS += PREFIX=$(PROTO_DIR)

build:		$(BUILD_64)

test:		$(TEST_64)

install:	$(INSTALL_64)

# Auto-generated dependencies
REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += system/library/math
