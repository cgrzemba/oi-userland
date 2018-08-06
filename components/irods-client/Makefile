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
COMPONENT_SUBNAME=	irods_client_icommands
COMPONENT_VERSION=	4.2.3
COMPONENT_VERSION_REV=	0
COMPONENT_VERSION_TAG=	1966ca3
COMPONENT_FMRI=     	service/irods-icommands
COMPONENT_CLASSIFICATION=Applications/System Utilities
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_SUBNAME)-$(COMPONENT_VERSION_TAG)
COMPONENT_PROJECT_URL=	http://www.irods.org
COMPONENT_ARCHIVE=	$(COMPONENT_SUBNAME)-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	\
    sha256:9dcf4bc2efaa8d1fca69cd433ad4eec4bf3fae106697b09a5951497ad5c67ee1
COMPONENT_ARCHIVE_URL=	http://github.com/$(COMPONENT_NAME)/$(COMPONENT_SUBNAME)/tarball/$(COMPONENT_VERSION)
COMPONENT_LICENSE=      BSD-3-Clause
COMPONENT_LICENSE_FILE = LICENSE
COMPONENT_SUMMARY=     	integrated Rule-Oriented Data System (iRODS) is open source data management software 

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/cmake.mk
include $(WS_MAKE_RULES)/ips.mk

PATH=$(PATH.gnu)

# CC=/usr/bin/clang
# CXX=/usr/bin/clang++
# CXXFLAGS: -DBOOST_SYSTEM_NO_DEPRECATED -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -D_LARGE_FILES -Dirods_rule_engine_plugin_go_EXPORTS -Dlinux_platform -fPIC -O3 -DNDEBUG -stdlib=libc++ -Wl,-z,defs -shared -nostdinc++ -std=c++11 -std=gnu++11
IRODS_CXX_STANDARD = 14
CXXFLAGS += -std=c++$(IRODS_CXX_STANDARD) -D_PTHREADS
# CXXFLAGS += -Wno-unknown-pragmas

FLAVOUR = OPT

# CMAKE_PREFIX = /

# CMAKE_CURRENT_LIST_DIR=$(shell pwd)/../irods/build/prototype/i386/usr/lib/irods/cmake
CMAKE_CURRENT_LIST_DIR=/usr/lib/irods/cmake

CMAKE_OPTIONS.DBG += --trace
CMAKE_OPTIONS.DBG += --trace-expand
CMAKE_OPTIONS.DBG += --debug-output
CMAKE_OPTIONS.DBG += --debug-trycompile
CMAKE_OPTIONS.DBG += -DCMAKE_BUILD_TYPE=Debug
# CMAKE_OPTIONS += -DIRODS_CXX_STANDARD=$(IRODS_CXX_STANDARD)
# CMAKE_OPTIONS += -DCMAKE_CXX_FLAGS="$(CXXFLAGS)"
CMAKE_OPTIONS += -DCMAKE_SOURCE_DIR=$(SOURCE_DIR)
CMAKE_OPTIONS += -DCMAKE_BINARY_DIR=$(@D)
CMAKE_OPTIONS += -DIRODS_VERSION=$(COMPONENT_VERSION)
CMAKE_OPTIONS += -DIRODS_VERSION_MAJOR=$(shell echo $(COMPONENT_VERSION)|cut -d. -f1)
CMAKE_OPTIONS += -DIRODS_VERSION_MINOR=$(shell echo $(COMPONENT_VERSION)|cut -d. -f1)
CMAKE_OPTIONS += -DIRODS_VERSION_PATCH=$(shell echo $(COMPONENT_VERSION)|cut -d. -f1)

CMAKE_OPTIONS += -DIRODS_EXTERNALS_FULLPATH_CLANG=/usr
# CMAKE_OPTIONS += -DCMAKE_C_COMPILER=/usr/bin/clang
# CMAKE_OPTIONS += -DCMAKE_CXX_COMPILER=/usr/bin/clang++
# CMAKE_OPTIONS += -DCMAKE_CPP_COMPILER=/usr/gcc/6/bin/cpp
CMAKE_OPTIONS.OPT += -DCMAKE_BUILD_TYPE=Release
CMAKE_OPTIONS += -DIRODS_LINUX_DISTRIBUTION_NAME=solaris
CMAKE_OPTIONS += -DIRODS_LINUX_DISTRIBUTION_VERSION_MAJOR=11
CMAKE_OPTIONS += -DCPACK_GENERATOR=TGZ
# CMAKE_OPTIONS += -DIRODS_GIT_SHA1=$(COMPONENT_VERSION_TAG)
CMAKE_OPTIONS += -DIRODS_EXTERNALS_FULLPATH_JANSSON=/usr
CMAKE_OPTIONS += -DIRODS_EXTERNALS_FULLPATH_BOOST=/usr
CMAKE_OPTIONS += -DIRODS_EXTERNALS_FULLPATH_AVRO=/usr
CMAKE_OPTIONS += -DIRODS_EXTERNALS_FULLPATH_ZMQ=/usr/zeromq-4.2
CMAKE_OPTIONS += -DIRODS_EXTERNALS_FULLPATH_ARCHIVE=/usr
# CMAKE_OPTIONS += -DIRODS_EXTERNALS_PACKAGE_ROOT=/usr
CMAKE_OPTIONS += -DCMAKE_INSTALL_PREFIX=/
CMAKE_OPTIONS += -DIRODS_INCLUDE_DIRS=/usr/include/irods
CMAKE_OPTIONS += -DIRODS_TARGETS_PATH=$(CMAKE_CURRENT_LIST_DIR)/IRODSTargets.cmake
CMAKE_OPTIONS.64 += -DCMAKE_INSTALL_RPATH=/usr/gcc/6/lib/64:/usr/zeromq-4.2/lib/64
CMAKE_OPTIONS.32 += -DCMAKE_INSTALL_RPATH=/usr/gcc/6/lib:/usr/zeromq-4.2/lib
CMAKE_OPTIONS += $(CMAKE_OPTIONS.$(FLAVOUR))
CMAKE_OPTIONS += $(CMAKE_OPTIONS.$(BITS))

COMPONENT_BUILD_GMAKE_ARGS = -j12

# no runpath in bins in clang linking
# COMPONENT_POST_INSTALL_ACTION =  \
# 	( cd  $(PROTOBINDIR) && find . | xargs file | grep ELF | cut -d: -f1 | xargs /usr/bin/elfedit -e 'dyn:runpath /usr/gcc/6/lib/64:/usr/zeromq-4.2/lib/64' )

build: $(BUILD_64)

install: $(INSTALL_64)

# test: $(NO_TESTS)

REQUIRED_PACKAGES += library/libcxx
REQUIRED_PACKAGES += library/avro-c++
REQUIRED_PACKAGES += library/unixodbc
REQUIRED_PACKAGES += library/c++/zeromq-4.2
REQUIRED_PACKAGES += library/c++/zeromq-4.2-header
REQUIRED_PACKAGES += library/jansson
REQUIRED_PACKAGES += library/security/openssl
REQUIRED_PACKAGES += system/library/boost
REQUIRED_PACKAGES += service/irods-runtime
REQUIRED_PACKAGES += $(GCC_RUNTIME_PKG)
REQUIRED_PACKAGES += $(GXX_RUNTIME_PKG)
REQUIRED_PACKAGES += system/library/math
