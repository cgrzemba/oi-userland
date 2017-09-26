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
# Copyright (c) 2011, 2016, Oracle and/or its affiliates. All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		nrpe
COMPONENT_VERSION=	2.15
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH= sha256:66383b7d367de25ba031d37762d83e2b55de010c573009c6f58270b137131072
COMPONENT_PROJECT_URL=	http://downloads.sourceforge.net/nagios/
COMPONENT_ARCHIVE_URL=	 https://sourceforge.net/projects/nagios/files/nrpe-2.x/$(COMPONENT_SRC)/$(COMPONENT_ARCHIVE)

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/configure.mk
include $(WS_MAKE_RULES)/ips.mk

COMPONENT_PREP_ACTION = (cd $(@D) ; autoconf -f)
# for DH key generation to work
COMPONENT_PRE_CONFIGURE_ACTION = (mkdir $(@D)/include )
COMPONENT_POST_CONFIGURE_ACTION = (rm -f $(SOURCE_DIR)/include/dh.h )

COMPONENT_POST_INSTALL_ACTION = \
	( install -d $(PROTOETCDIR)/nagios; install $(BUILD_DIR_64)/sample-config/nrpe.cfg $(PROTOETCDIR)/nagios);

CONFIGURE_OPTIONS += --enable-command-args
CONFIGURE_OPTIONS += --with-kerberos-inc=/usr/include/kerberosv5

build:          $(BUILD_64)

install:        $(INSTALL_64)

REQUIRED_PACKAGES += library/readline
REQUIRED_PACKAGES += library/security/openssl
REQUIRED_PACKAGES += system/library
