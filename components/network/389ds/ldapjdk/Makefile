#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
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

#
# Copyright (c) 2017, cgrzemba@opencsw.org
#

include ../../../../make-rules/shared-macros.mk

COMPONENT_NAME=         ldapjdk
COMPONENT_VERSION=      4.19
COMPONENT_PROJECT_URL=  http://developer.mozilla.org
# COMPONENT_ARCHIVE_HASH= \
#     sha256:228c03d560328c82671ea3cfb2dad9dc0f16b100cfa024d0555e8658e94e4137
# COMPONENT_ARCHIVE = $(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.bz2
# COMPONENT_ARCHIVE_URL=  http:///$(COMPONENT_ARCHIVE)
COMPONENT_SRC = $(COMPONENT_NAME)-$(HG_REV)
COMPONENT_BUGDB=

HG_REV=c07685b0f90a
HG_REPO=https://hg.mozilla.org/projects/ldap-sdks
HG_HASH = sha256:888a367d03511d2c774205e892dc131df9b8aaf98efde290e472d33f5a34cd1f

COPYRIGHTS = MPL
COPYRIGHT_FILE = COPYING

# JAVA_HOME=/usr/jdk/instances/jdk1.7.0

BUILD_BITS= NO_ARCH

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/justmake.mk
include $(WS_MAKE_RULES)/ips.mk

# COMPONENT_PREP_ACTION = ( \
#	$(CLONEY) $(SOURCE_DIR) $(@D); )

COMPONENT_INSTALL_ACTION = true

COMPONENT_POST_INSTALL_ACTION = \
	(  ginstall -d $(PROTOUSRSHARELIBDIR)/java ; \
	gcp -fp $(@D)/java-sdk/dist/packages/ldapjdk.jar $(PROTOUSRSHARELIBDIR)/java  )

COMPONENT_BUILD_GMAKE_ARGS  = -C java-sdk -f ldap.mk
COMPONENT_BUILD_ARGS += MOZ_SRC=.
COMPONENT_BUILD_ARGS += JAVA_VERSION=1.8
COMPONENT_BUILD_ARGS += JAVA_HOME=$(JAVA_HOME)
COMPONENT_BUILD_TARGETS = all basepackage

build: $(BUILD_32_and_64)

install: $(INSTALL_32_and_64)

include $(WS_TOP)/make-rules/depend.mk
