#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL)". You may
# only use this file in accordance with the terms of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright (c) 2014 Alexander Pyhalov
#

include ../../../../make-rules/shared-macros.mk

COMPONENT_NAME=		gnome-settings-daemon
COMPONENT_VERSION=	2.91.93
COMPONENT_REVISION=	0
COMPONENT_PROJECT_URL=	http://www.gnome.org
COMPONENT_SUMMARY=	The GNOME settings daemon
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	\
    sha256:22c7a4535298d3a87140a2c27bfdeb7f67a2b912eb555ce90c786ec47ef9d91d
COMPONENT_ARCHIVE_URL=	http://ftp.gnome.org/pub/GNOME/sources/$(COMPONENT_NAME)/$(basename $(COMPONENT_VERSION))/$(COMPONENT_ARCHIVE)
COMPONENT_FMRI= gnome/gnome-settings-daemon
COMPONENT_LICENSE_FILE=	COPYING
COMPONENT_LICENSE= 	GPLv2

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/configure.mk
include $(WS_TOP)/make-rules/ips.mk

PATH=/usr/gnu/bin:/usr/bin

LDFLAGS.32 += -L/usr/lib/mps -R/usr/lib/mps
LDFLAGS += $(LDFLAGS.$(BITS))

COMPONENT_PREP_ACTION =        ( cd $(@D) && \
                                        aclocal -I. && \
                                        autoheader && \
                                        libtoolize --automake --copy --force && \
                                        automake -a -f -c &&\
                                        autoconf )

# Missing files in build dir for configure without this.
COMPONENT_PRE_CONFIGURE_ACTION =	($(CLONEY) $(SOURCE_DIR) $(@D))

CFLAGS += -DDBUS_API_SUBJECT_TO_CHANGE -DGNOME_DESKTOP_USE_UNSTABLE_API -I/usr/X11/share/include
LDFLAGS += -L/usr/X11/lib -R/usr/X11/lib -lfreetype -lresolv -lgthread-2.0

CONFIGURE_OPTIONS+=	--sysconfdir=/etc
CONFIGURE_OPTIONS+=	--libexecdir=/usr/lib
CONFIGURE_OPTIONS+=	--disable-static
CONFIGURE_OPTIONS+=	--disable-aboutme
CONFIGURE_OPTIONS+=	--disable-pulse
CONFIGURE_OPTIONS+=	--disable-gstreamer
CONFIGURE_OPTIONS+=	--disable-cups

CONFIGURE_OPTIONS+=	--enable-debug
CONFIGURE_OPTIONS+=	--disable-silent-rules

COMPONENT_INSTALL_ENV+= GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1

# common targets
build:		$(BUILD_64)

install:	$(INSTALL_64)

test:		$(NO_TESTS)

# Auto-generated dependencies
REQUIRED_PACKAGES += gnome/config/gconf
REQUIRED_PACKAGES += library/desktop/cairo
REQUIRED_PACKAGES += library/desktop/gdk-pixbuf
REQUIRED_PACKAGES += library/desktop/gnome-desktop
REQUIRED_PACKAGES += library/desktop/gtk3
REQUIRED_PACKAGES += library/desktop/libxklavier
REQUIRED_PACKAGES += library/glib2
REQUIRED_PACKAGES += library/gnome/libgnomekbd
REQUIRED_PACKAGES += library/libnotify
REQUIRED_PACKAGES += library/nspr
REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += system/library/fontconfig
REQUIRED_PACKAGES += system/library/libdbus-glib
REQUIRED_PACKAGES += system/library/math
REQUIRED_PACKAGES += system/library/mozilla-nss
REQUIRED_PACKAGES += x11/library/libx11
REQUIRED_PACKAGES += x11/library/libxi
REQUIRED_PACKAGES += x11/library/libxxf86misc
