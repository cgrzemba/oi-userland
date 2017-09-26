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

COMPONENT_NAME=         idm-console-framework
COMPONENT_VERSION=      1.1.9
COMPONENT_SRC = $(COMPONENT_SRC_NAME)-$(COMPONENT_VERSION)
COMPONENT_PROJECT_URL=  http://directory.fedoraproject.org
COMPONENT_ARCHIVE_HASH= \
    sha256:21553f2a9f31d526c04b920ddbaa5cd582efb3927505df6cd383a1620d740ffb
COMPONENT_ARCHIVE = $(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.bz2
COMPONENT_ARCHIVE_URL=  http://directory.fedoraproject.org/binaries/$(COMPONENT_ARCHIVE)
COMPONENT_BUGDB=

BUILD_BITS= NO_ARCH
JAVA_HOME=/usr/jdk/instances/jdk1.7.0

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/ant.mk
include $(WS_MAKE_RULES)/ips.mk

MAJOR_VERSION = $(basename $(COMPONENT_VERSION))

COMPONENT_POST_INSTALL_ACTION = \
	(       ginstall -d $(PROTOUSRSHARELIBDIR)/java; \
		gcp -fp $(@D)/$(DISTNAME)/built/release/jars/idm-console-base.jar $(PROTOUSRSHARELIBDIR)/java/ ; \
		gcp -fp $(@D)/built/release/jars/idm-console-mcc.jar $(PROTOUSRSHARELIBDIR)/java/ ; \
	gcp -fp $(@D)/built/release/jars/idm-console-mcc_en.jar $(PROTOUSRSHARELIBDIR)/java/ ; \
	gcp -fp $(@D)/built/release/jars/idm-console-nmclf.jar $(PROTOUSRSHARELIBDIR)/java/ ; \
	gcp -fp $(@D)/built/release/jars/idm-console-nmclf_en.jar $(PROTOUSRSHARELIBDIR)/java/ ; \
	( cd $(PROTOUSRSHARELIBDIR)/java ; \
		echo ln -s idm-console-base-$(COMPONENT_VERSION).jar idm-console-base-$(MAJOR_VERSION).jar ; \
		echo ln -s idm-console-base.jar idm-console-base-$(COMPONENT_VERSION).jar ; \
		echo ln -s idm-console-mcc.jar idm-console-mcc-$(COMPONENT_VERSION).jar ; \
		echo ln -s idm-console-mcc_en.jar idm-console-mcc-$(COMPONENT_VERSION)_en.jar ; \
		echo ln -s idm-console-nmclf.jar idm-console-nmclf-$(COMPONENT_VERSION).jar ; \
		echo ln -s idm-console-nmclf_en.jar idm-console-nmclf-$(COMPONENT_VERSION)_en.jar ; \
	) )

COMPONENT_BUILD_ENV += JAVA_HOME=/usr/jdk/instances/jdk1.7.0

COMPONENT_BUILD_ARGS += -Dbuilt.dir=$(@D)/built
COMPONENT_BUILD_ARGS += -Dldapjdk.local.location=$(USRSHARELIBDIR)/java 
COMPONENT_BUILD_ARGS += -Djss.local.location=$(USRSHARELIBDIR)/java

COMPONENT_BUILD_TARGETS =      
COMPONENT_INSTALL_ENV = $(COMPONENT_BUILD_ENV)
COMPONENT_INSTALL_TARGETS =      package
COMPONENT_INSTALL_ARGS = $(COMPONENT_BUILD_ARGS)

build:	$(BUILD_32)

install: $(INSTALL_32)

REQUIRED_PACKAGES += library/java/ldap-sdk
REQUIRED_PACKAGES += library/java/libjss4
