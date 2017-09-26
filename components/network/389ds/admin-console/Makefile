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

COMPONENT_NAME=         389-admin-console
COMPONENT_VERSION=      1.1.12
COMPONENT_SRC  = $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_PROJECT_URL=  http://directory.fedoraproject.org
COMPONENT_ARCHIVE_HASH= \
    sha256:9eea595bc74b0f704a2f9621258c7d96f6850fddf764af7c221f7a65f5335237
COMPONENT_ARCHIVE = $(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.bz2
COMPONENT_ARCHIVE_URL=  http://directory.fedoraproject.org/binaries/$(COMPONENT_ARCHIVE)
COMPONENT_BUGDB=

MAJOR_VERSION = $(basename $(COMPONENT_VERSION))

BUILD_BITS= NO_ARCH

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/ant.mk
include $(WS_MAKE_RULES)/ips.mk

COMPONENT_PRE_BUILD_ACTION = \
        ($(CLONEY) $(SOURCE_DIR) $(@D))

COMPONENT_POST_INSTALL_ACTION = \
	( ginstall -d $(PROTOUSRSHAREDIR)/dirsrv/html/java; \
	ginstall -d $(PROTOUSRSHAREDIR)/dirsrv/manual/en/admin/help; \
	gcp -fp $(@D)/built/package/*.jar $(PROTOUSRSHAREDIR)/dirsrv/html/java/ ; \
	ginstall -m644 $(@D)/help/en/*.html $(PROTOUSRSHAREDIR)/dirsrv/manual/en/admin ; \
	ginstall -m644 $(@D)/help/en/tokens.map $(PROTOUSRSHAREDIR)/dirsrv/manual/en/admin ; \
	ginstall -m644 $(@D)/help/en/help/*.html $(PROTOUSRSHAREDIR)/dirsrv/manual/en/admin/help )

# COMPONENT_BUILD_ENV += JAVA_HOME=/usr/jdk/instances/jdk1.7.0

COMPONENT_BUILD_ARGS += -Dconsole.location=$(USRSHARELIBDIR)/java 
COMPONENT_BUILD_ARGS += -Dbuilt.dir=$(@D)/built
COMPONENT_BUILD_ARGS += -Dldapjdk.location=$(USRSHARELIBDIR)/java
COMPONENT_BUILD_TARGETS =      build

COMPONENT_INSTALL_ARGS = $(COMPONENT_BUILD_ARGS)
COMPONENT_INSTALL_TARGETS =      dist

build: $(BUILD_32)

install: $(INSTALL_32)

REQUIRED_PACKAGES += library/java/ldap-sdk
REQUIRED_PACKAGES += library/java/libjss4
# build requirements
REQUIRED_PACKAGES += developer/java/openjdk8
