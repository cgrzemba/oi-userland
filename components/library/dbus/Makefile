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
# Copyright 2016 Alexander Pyhalov
# Copyright 2019 Michal Nowak
# Copyright 2020 Andreas Wacknitz
#

BUILD_BITS=			32_and_64
include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		dbus
COMPONENT_VERSION=	1.12.20
COMPONENT_REVISION=	1
COMPONENT_SUMMARY=	Simple IPC library based on messages
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH= \
	sha256:f77620140ecb4cdc67f37fb444f8a6bea70b5b6461f12f1cbe2cec60fa7de5fe
COMPONENT_ARCHIVE_URL= \
	https://dbus.freedesktop.org/releases/dbus/$(COMPONENT_ARCHIVE)
COMPONENT_PROJECT_URL=	https://www.freedesktop.org/wiki/Software/dbus/
COMPONENT_LICENSE_FILE=	COPYING
COMPONENT_LICENSE=	GPLv2,AFLv2.1
COMPONENT_CLASSIFICATION= System/Libraries
COMPONENT_FMRI=		system/library/dbus

include $(WS_MAKE_RULES)/common.mk

PATH=$(PATH.gnu)

COMPONENT_PREP_ACTION =	( cd $(@D) && autoreconf --force --install )

CPPFLAGS += -std=gnu89

CONFIGURE_OPTIONS += --sysconfdir=/etc
CONFIGURE_OPTIONS += --libexecdir=$(CONFIGURE_LIBDIR.$(BITS))
CONFIGURE_OPTIONS += --localstatedir=/var
CONFIGURE_OPTIONS += --with-dbus-user=root
CONFIGURE_OPTIONS += --with-dbus-daemondir=$(CONFIGURE_LIBDIR.$(BITS))
CONFIGURE_OPTIONS += --disable-static

CONFIGURE_ENV    += CPPFLAGS="$(CPPFLAGS)"
CONFIGURE_ENV    += PERL=$(PERL)
CONFIGURE_ENV    += PYTHON=$(PYTHON)

COMPONENT_TEST_TRANSFORMER = $(NAWK)
COMPONENT_TEST_TRANSFORMS = "'/TOTAL|PASS|FAIL|XFAIL|SKIP|XPASS|ERROR/'"

# To prevent "libtool_install_magic: unbound variable"
unexport SHELLOPTS

REQUIRED_PACKAGES += developer/documentation-tool/doxygen
REQUIRED_PACKAGES += developer/build/autoconf-archive
REQUIRED_PACKAGES += library/gnome/yelp-tools
REQUIRED_PACKAGES += text/xmlto

# Auto-generated dependencies
REQUIRED_PACKAGES += SUNWcs
REQUIRED_PACKAGES += library/expat
REQUIRED_PACKAGES += system/library
#REQUIRED_PACKAGES += system/library/libdbus
REQUIRED_PACKAGES += x11/library/libx11
