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
COMPONENT_VERSION=	1.7.7
COMPONENT_PROJECT_URL=	https://avro.apache.org
COMPONENT_SUMMARY=	data serialization system
COMPONENT_FMRI=         library/avro-c++
COMPONENT_CLASSIFICATION=       System/Libraries
COMPONENT_SRC=		$(COMPONENT_NAME)-src-$(COMPONENT_VERSION)
COMPONENT_SRC1 =		$(COMPONENT_NAME)-doc-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	\
	sha256:343c69331f4bc68ab9a9009117e900478bf73ca94b3357bcab977d97b346fb8d
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

# CC = /usr/bin/clang
# CXX = /usr/bin/clang++
CXXFLAGS += -std=c++11 -pthread -pthreads -D_PTHREADS

LIBCXX = libstdc++
# LIBCXX = libc++

CXXFLAGS.libc++ += -nostdinc++
CXXFLAGS.libc++ += -I/usr/include/c++/v1
CXXFLAGS += $(CXXFLAGS.$(LIBCXX))

CMAKE_EXE_LINKER_FLAGS.clang += -stdlib=$(LIBCXX) -shared
CMAKE_EXE_LINKER_FLAGS.libc++ += -lc++abi
CMAKE_EXE_LINKER_FLAGS += $(CMAKE_EXE_LINKER_FLAGS.$(LIBCXX))

# CMAKE_OPTIONS += -DCMAKE_BUILD_TYPE=Debug

CMAKE_OPTIONS += -G"Unix Makefiles"
CMAKE_OPTIONS += -DCMAKE_EXE_LINKER_FLAGS="-m$(BITS) $(CMAKE_EXE_LINKER_FLAGS)"

COMPONENT_BUILD_GMAKE_ARGS += -j12 -C build
COMPONENT_INSTALL_ARGS += -C build

# common targets
build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

test:		$(TEST_32_and_64)
# Auto-generated dependencies
REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += system/library/boost
REQUIRED_PACKAGES += $(GCC_RUNTIME_PKG)
REQUIRED_PACKAGES += $(GXX_RUNTIME_PKG)
