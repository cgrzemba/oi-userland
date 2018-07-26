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

COMPONENT_NAME=		libcxx
COMPONENT_VERSION=	4.0.1
COMPONENT_PROJECT_URL=	https://libcxx.llvm.org/
COMPONENT_SUMMARY=	libc++ is a new implementation of the C++ standard library, targeting C++11
COMPONENT_FMRI=         library/libcxx
COMPONENT_CLASSIFICATION=       System/Libraries
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION).src
COMPONENT_ABI_SRC =	$(COMPONENT_NAME)abi-$(COMPONENT_VERSION).src
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	\
	sha256:520a1171f272c9ff82f324d5d89accadcec9bc9f3c78de11f5575cdb99accc4c
COMPONENT_ARCHIVE_URL=	http://releases.llvm.org/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

COMPONENT_LICENSE=	MIT
COMPONENT_LICENSE_FILE=	LICENSE.TXT

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/cmake.mk
include $(WS_MAKE_RULES)/ips.mk

PATH:=$(GNUBIN):$(PATH)

COMPONENT_PRE_CMAKE_ACTION = \
	( mkdir $(@D)/build;  )

CC  = clang
CXX = clang++

COMPONENT_ABI_DIR = $(COMPONENT_DIR)/abi

CMAKE_OPTIONS += -DCMAKE_BUILD_TYPE=Release
# CMAKE_OPTIONS += -DLLVM_BUILD_32_BITS=ON
CMAKE_OPTIONS += -DLIBCXX_CXX_ABI=libcxxabi
CMAKE_OPTIONS += -DLIBCXX_CXX_ABI_INCLUDE_PATHS=$(COMPONENT_ABI_DIR)/$(COMPONENT_ABI_SRC)/include
CMAKE_OPTIONS.32 += -DLIBCXX_CXX_ABI_LIBRARY_PATH=$(PROTOUSRLIBDIR)/
CMAKE_OPTIONS.64 += -DLIBCXX_CXX_ABI_LIBRARY_PATH=$(PROTOUSRLIBDIR)/$(MACH64)
CMAKE_OPTIONS += -DLIBCXX_ENABLE_STATIC=OFF
CMAKE_OPTIONS.64 += -DLIBCXX_LIBDIR_SUFFIX="/$(MACH64)"
CMAKE_OPTIONS += -DLIBCXX_ENABLE_ABI_LINKER_SCRIPT=OFF

# common targets
COMPONENT_PRE_BUILD_ACTION = ( cd $(COMPONENT_ABI_DIR) && gmake install )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

COMPONENT_TEST_TARGETS = check-libcxx
test:		$(TEST_32_and_64)

REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += system/library/gcc-4-runtime
