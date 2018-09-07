#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source.  A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright 2018 cgrzemba
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		kanki-irodsclient
COMPONENT_VERSION=	1.1.0.2
COMPONENT_GIT_VERSION=	1.1.0b2
COMPONENT_PROJECT_URL=	http://github.com/ilarik/kanki-irodsclient
COMPONENT_FMRI=		desktop/kanki/irodsclient
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_GIT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_GIT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	\
    sha256:bd49b664c9f2387eb4ad97c18392b460014eb14db5c50f31470d351e1878e286
COMPONENT_ARCHIVE_URL=	https://github.com/ilarik/kanki-irodsclient/archive/$(COMPONENT_ARCHIVE)
COMPONENT_LICENSE=	BSD 3-Clause
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_SUMMARY=	native GUI client for iRODS
COMPONENT_CLASSIFICATION=System/X11

include ../../../make-rules/prep.mk
include ../../../make-rules/justmake.mk
include ../../../make-rules/ips.mk

QMAKE_CXXFLAGS += "-pthreads"

QTROOT=/usr/lib/qt/5.8

COMPONENT_BUILD_ACTION = \
	cd $(@D)/src; $(ENV) $(COMPONENT_BUILD_ENV) \
	$(QTROOT)/bin/$(MACH64)/qmake && \
	gmake

COMPONENT_INSTALL_ACTION = \
	$(INSTALL) -d 755 $(PROTO_DIR)$(USRBINDIR)/ ; \
	$(INSTALL) -d 755 $(PROTO_DIR)$(ETCDIR)/irods/ ; \
	$(INSTALL) -d 755 $(PROTO_DIR)$(USRSHAREDIR)/applications/ ; \
	$(INSTALL) -d 755 $(PROTO_DIR)$(USRSHAREDIR)/icons/hicolor/128x128/apps/ ; \
	$(INSTALL) -Dpm 755 $(@D)/src/irodsclient $(PROTO_DIR)$(USRBINDIR)/ ; \
	$(INSTALL) -Dpm 644 $(@D)/src/schema.xml $(PROTO_DIR)$(ETCDIR)/irods/ ; \
	$(INSTALL) -Dpm 644 $(@D)/irodsclient.desktop $(PROTO_DIR)$(USRSHAREDIR)/applications/ ; \
	$(INSTALL) -Dpm 644 $(@D)/src/icons/irodsclient.png $(PROTO_DIR)$(USRSHAREDIR)/icons/hicolor/128x128/apps/

build:		$(BUILD_64)

install:	$(INSTALL_64)

# Auto-generated dependencies
REQUIRED_PACKAGES += library/qt5
REQUIRED_PACKAGES += library/security/openssl
REQUIRED_PACKAGES += service/irods-runtime
REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += system/library/boost
REQUIRED_PACKAGES += system/library/g++-4-runtime
REQUIRED_PACKAGES += system/library/gcc-4-runtime
REQUIRED_PACKAGES += system/library/math
