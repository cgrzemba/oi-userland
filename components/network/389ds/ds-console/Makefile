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

COMPONENT_NAME=         389-ds-console
COMPONENT_VERSION=      1.2.16
COMPONENT_SRC = $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_PROJECT_URL=  http://directory.fedoraproject.org
COMPONENT_ARCHIVE_HASH= \
    sha256:ee7267b1700d0f42a8f71a6f80fb02bd6c7065578201669a3838f21b514b0f7b
COMPONENT_ARCHIVE = $(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.bz2
COMPONENT_ARCHIVE_URL=  http://directory.fedoraproject.org/binaries/$(COMPONENT_ARCHIVE)
COMPONENT_BUGDB=

MAJOR_VERSION = $(basename $(COMPONENT_VERSION))

BUILD_BITS= NO_ARCH

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/ant.mk
include $(WS_MAKE_RULES)/ips.mk

COMPONENT_POST_INSTALL_ACTION = ( \
	ginstall -d $(PROTOUSRSHAREDIR)/dirsrv/html/java; \
	ginstall -d $(PROTOUSRSHAREDIR)/dirsrv/manual/en/slapd/help; \
	gcp -fp $(@D)/built/package/*.jar $(PROTOUSRSHAREDIR)/dirsrv/html/java/ ; \
	ginstall -m644 $(@D)/help/en/*.html $(PROTOUSRSHAREDIR)/dirsrv/manual/en/slapd ; \
	ginstall -m644 $(@D)/help/en/tokens.map $(PROTOUSRSHAREDIR)/dirsrv/manual/en/slapd ; \
	ginstall -m644 $(@D)/help/en/help/*.html $(PROTOUSRSHAREDIR)/dirsrv/manual/en/slapd/help )

COMPONENT_BUILD_ENV += JAVA_HOME=$(JAVA_HOME)

COMPONENT_BUILD_ARGS += -Dconsole.location=$(USRSHARELIBDIR)/java 
COMPONENT_BUILD_ARGS += -Dbuilt.dir=$(@D)/built
COMPONENT_BUILD_ARGS += -Dldapjdk.location=$(USRSHARELIBDIR)/java

OMPONENT_BUILD_TARGETS =      build

COMPONENT_INSTALL_ARGS = $(COMPONENT_BUILD_ARGS)
COMPONENT_INSTALL_TARGETS =      dist

build: $(BUILD_32)

install: $(INSTALL_32)

REQUIRED_PACKAGES += library/java/ldap-sdk
REQUIRED_PACKAGES += library/java/libjss4
