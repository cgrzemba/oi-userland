#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.illumos.org/license/CDDL.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright (c) 2018, Carsten Grzemba. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		irods
COMPONENT_VERSION=	4.2.4
COMPONENT_REVISION =	4
COMPONENT_VERSION_TAG=	110b463
COMPONENT_FMRI=     	service/irods-runtime
COMPONENT_CLASSIFICATION=Applications/System Utilities
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_NAME)-$(COMPONENT_VERSION_TAG)
COMPONENT_PROJECT_URL=	http://www.irods.org
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	\
    sha256:24a3afa94385223ed41563c35199011cd99e2cb988355478c952e5a9064f0b69
COMPONENT_ARCHIVE_URL=	http://github.com/$(COMPONENT_NAME)/$(COMPONENT_NAME)/tarball/$(COMPONENT_VERSION)
COMPONENT_LICENSE=      BSD-3-Clause
COMPONENT_LICENSE_FILE = LICENSE
COMPONENT_SUMMARY=     	integrated Rule-Oriented Data System (iRODS) is open source data management software, server and runtime 

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/cmake.mk
include $(WS_MAKE_RULES)/ips.mk

PATH=$(PATH.gnu)


# FLAVOUR = OPT
FLAVOUR = DBG

IRODS_GIT_SHA1 = c946c024496bfd2dc51285c9599bd606c1fde8f6
IRODS_CXX_STANDARD = 14
CFLAGS =  -m$(BITS)
CXXFLAGS = -m$(BITS)
CXXFLAGS += -std=c++$(IRODS_CXX_STANDARD) -D_PTHREADS
CXXFLAGS += -Wno-unknown-pragmas
# CXXFLAGS += -Wno-format-truncation -Wno-implicit-fallthrough
CXXFLAGS += -Wno-unused-variable
CXXFLAGS.DBG += -gdwarf-2 -g0 -O0 -fno-builtin-flags
CXXFLAGS += $(CXXFLAGS.$(FLAVOUR))

LIBSUFFIX.64 = /$(MACH64)
LIBSUFFIX = $(LIBSUFFIX.$(BITS))

# CMAKE_PREFIX = /

# CMAKE_OPTIONS.DBG += --trace
# CMAKE_OPTIONS.DBG += --trace-expand
# CMAKE_OPTIONS.DBG += --debug-output
# CMAKE_OPTIONS.DBG += --debug-trycompile
CMAKE_OPTIONS.OPT += -DCMAKE_BUILD_TYPE=Release
CMAKE_OPTIONS.DBG += -DCMAKE_BUILD_TYPE=Debug
CMAKE_OPTIONS.DBG += -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON
CMAKE_OPTIONS += $(CMAKE_OPTIONS.$(FLAVOUR))

CMAKE_OPTIONS+= "$(CXXFLAGS)"
CMAKE_OPTIONS+= -DIRODS_EXTERNALS_FULLPATH_CLANG=/usr
# CMAKE_OPTIONS+= -DCMAKE_C_COMPILER=/usr/bin/clang
# CMAKE_OPTIONS+= -DCMAKE_CXX_COMPILER=/usr/bin/clang++
CMAKE_OPTIONS+= -DCMAKE_C_COMPILER=/usr/gcc/$(GCC_VERSION_MAJOR)/bin/gcc
CMAKE_OPTIONS+= -DCMAKE_CXX_COMPILER=/usr/gcc/$(GCC_VERSION_MAJOR)/bin/g++
CMAKE_OPTIONS+= -DCMAKE_CPP_COMPILER=/usr/gcc/$(GCC_VERSION_MAJOR)/bin/cpp
CMAKE_OPTIONS+= -DIRODS_LINUX_DISTRIBUTION_NAME=solaris
CMAKE_OPTIONS+= -DIRODS_LINUX_DISTRIBUTION_VERSION_MAJOR=11
CMAKE_OPTIONS+= -DIRODS_CXX_STANDARD=$(IRODS_CXX_STANDARD)
CMAKE_OPTIONS+= -DCPACK_GENERATOR=TGZ
CMAKE_OPTIONS+= -DIRODS_GIT_SHA1=$(IRODS_GIT_SHA1)
CMAKE_OPTIONS+= -DIRODS_EXTERNALS_FULLPATH_JANSSON=/usr
CMAKE_OPTIONS+= -DIRODS_EXTERNALS_FULLPATH_BOOST=/usr
CMAKE_OPTIONS+= -DIRODS_EXTERNALS_FULLPATH_AVRO=/usr
CMAKE_OPTIONS+= -DIRODS_EXTERNALS_FULLPATH_ZMQ=/usr/zeromq-4.2
CMAKE_OPTIONS+= -DIRODS_EXTERNALS_FULLPATH_ARCHIVE=/usr
CMAKE_OPTIONS+= -DIRODS_EXTERNALS_PACKAGE_ROOT=/usr
CMAKE_OPTIONS+= -DCMAKE_INSTALL_PREFIX=/
CMAKE_OPTIONS.64 += -DCMAKE_INSTALL_RPATH=/usr/gcc/$(GCC_VERSION_MAJOR)/lib/amd64:/usr/zeromq-4.2/lib/amd64
# CMAKE_OPTIONS.64 += -DIRODS_EXTERNALS_FULLPATH_CLANG_RUNTIME=/usr/gcc/$(GCC_VERSION_MAJOR)
CMAKE_OPTIONS.64 += -DCMAKE_SHARED_LINKER_FLAGS="-R/usr/gcc/$(GCC_VERSION_MAJOR)/lib/amd64 -R/usr/zeromq-4.2/lib/amd64"
# CMAKE_OPTIONS.32 += -DCMAKE_INSTALL_RPATH=/usr/gcc/$(GCC_VERSION_MAJOR)/lib:/usr/zeromq-4.2/lib
CMAKE_OPTIONS += $(CMAKE_OPTIONS.$(BITS))

COMPONENT_PRE_CMAKE_ACTION = ( cd $(SOURCE_DIR) && tar xf $(COMPONENT_DIR)/Solaris/irods_schema_messaging.tar )

COMPONENT_BUILD_GMAKE_ARGS = -j14

# no runpath in bins
COMPONENT_POST_INSTALL_ACTION =  cd  $(PROTOUSRSBINDIR) && for f in `/usr/bin/find . -type f`; { /usr/bin/elfedit -e 'dyn:runpath /usr/gcc/$(GCC_VERSION_MAJOR)/lib$(LIBSUFFIX):/usr/zeromq-4.2/lib$(LIBSUFFIX)' $$f; };
# use this with patch +set(IRODS_PLUGINS_DIRECTORY usr/lib/irods/${LIB_SUFFIX}/plugins)
# COMPONENT_POST_INSTALL_ACTION += cd $(PROTOUSRLIBDIR)/irods$(LIBSUFFIX)/plugins && for f in `/usr/bin/find . -name "lib*so*"`; { /usr/bin/elfedit -e 'dyn:runpath /usr/gcc/$(GCC_VERSION_MAJOR)/lib$(LIBSUFFIX)' $$f;};
COMPONENT_POST_INSTALL_ACTION += cd $(PROTOUSRLIBDIR)/irods/plugins && for f in `/usr/bin/find . -name "lib*so*"`; { /usr/bin/elfedit -e 'dyn:runpath /usr/gcc/$(GCC_VERSION_MAJOR)/lib$(LIBSUFFIX)' $$f;};
COMPONENT_POST_INSTALL_ACTION += cd $(PROTOUSRLIBDIR)$(LIBSUFFIX) && for f in `/usr/bin/find . -name "lib*so*"`; { /usr/bin/elfedit -e 'dyn:runpath /usr/gcc/$(GCC_VERSION_MAJOR)/lib$(LIBSUFFIX)' $$f;};
COMPONENT_POST_INSTALL_ACTION += cd $(PROTOVARDIR)/lib/irods/clients/bin && /usr/bin/elfedit -e 'dyn:runpath /usr/gcc/$(GCC_VERSION_MAJOR)/lib$(LIBSUFFIX)' genOSAuth;

build: $(BUILD_64)

install: $(INSTALL_64)

# test: $(NO_TESTS)

REQUIRED_PACKAGES += library/libcxx
REQUIRED_PACKAGES += library/avro-c++
REQUIRED_PACKAGES += library/unixodbc
REQUIRED_PACKAGES += library/c++/zeromq-4.2
REQUIRED_PACKAGES += library/c++/zeromq-4.2-header
REQUIRED_PACKAGES += library/jansson
REQUIRED_PACKAGES += library/libarchive
REQUIRED_PACKAGES += library/security/openssl
REQUIRED_PACKAGES += system/library/boost
REQUIRED_PACKAGES += system/library/math
REQUIRED_PACKAGES += $(GCC_RUNTIME_PKG)
REQUIRED_PACKAGES += $(GXX_RUNTIME_PKG)
REQUIRED_PACKAGES += library/python/psutil
REQUIRED_PACKAGES += shell/bash
