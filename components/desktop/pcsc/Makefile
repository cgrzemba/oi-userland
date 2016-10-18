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
# Copyright 2016 Carsten Grzemba cgrzemba@opencsw.org
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME =	PCSC
COMPONENT_VERSION =	1.8.18
COMPONENT_VERSION_TAG =  pcsc-$(COMPONENT_VERSION)
COMPONENT_PROJECT_URL =	https://github.com/LudovicRousseau/$(COMPONENT_NAME)

COMPONENT_FMRI =	desktop/pcsc
COMPONENT_SRC =		$(COMPONENT_NAME)-$(COMPONENT_VERSION_TAG)
COMPONENT_ARCHIVE =	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH =	\
	sha256:d5ffb120bd8b004870f0449488ac5bb0e81a91fb169e49e0f8b3a4f71b85a972
COMPONENT_ARCHIVE_URL =  $(COMPONENT_PROJECT_URL)/archive/$(COMPONENT_VERSION_TAG).tar.gz
COMPONENT_LICENSE =	GPLv3
COMPONENT_LICENSE_FILE = COPYING

COMPONENT_SUMMARY = The purpose of PCSC Lite is to provide a SCard interface in a very small form factor for communicating to smart cards and readers.
COMPONENT_CLASSIFICATION = Applications/Accessories

IPS_COMPONENT_VERSION = $(COMPONENT_VERSION)

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/configure.mk
include $(WS_MAKE_RULES)/ips.mk

COMPONENT_PREP_ACTION = \
        (cd $(@D);  libtoolize --copy --force ; \
        aclocal -I . ; \
        autoheader ; \
        automake --add-missing --copy ; \
        autoconf)


CONFIGURE_OPTIONS += --sysconfdir=/etc
CONFIGURE_OPTIONS += --disable-silent-rules

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

REQUIRED_PACKAGES += developer/lexer/flex
