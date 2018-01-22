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
# Copyright (c) 2018 Alexander Pyhalov
<<<<<<< HEAD
# Copyright (c) 2019 Michal Nowak
=======
>>>>>>> Add mate-power-manager 1.18.1
#

include ../../../../make-rules/shared-macros.mk

COMPONENT_NAME=		mate-power-manager
<<<<<<< HEAD
COMPONENT_MJR_VERSION=  1.22
=======
COMPONENT_MJR_VERSION=  1.18
>>>>>>> Add mate-power-manager 1.18.1
COMPONENT_MNR_VERSION=  1
COMPONENT_VERSION=      $(COMPONENT_MJR_VERSION).$(COMPONENT_MNR_VERSION)
COMPONENT_PROJECT_URL=  http://www.mate-desktop.org
COMPONENT_SUMMARY=      MATE Power Manager utilities for desktop users
COMPONENT_SRC=          $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=      $(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	\
<<<<<<< HEAD
	sha256:ba6647acea13852ac5bd2423dedbb68033eb056871ba58812c42074a08177a1b
=======
    sha256:25dbd47c063d9aa2ed4be6401f6650aec11e0baa6bdd5dbb12cbb6952461cbeb
>>>>>>> Add mate-power-manager 1.18.1
COMPONENT_ARCHIVE_URL=  http://pub.mate-desktop.org/releases/$(COMPONENT_MJR_VERSION)/$(COMPONENT_ARCHIVE)
COMPONENT_FMRI=		desktop/mate/mate-power-manager
COMPONENT_CLASSIFICATION=	Applications/System Utilities
COMPONENT_LICENSE=	GPLv2
COMPONENT_LICENSE_FILE=	COPYING

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/configure.mk
include $(WS_MAKE_RULES)/ips.mk

PATH=$(PATH.gnu)

<<<<<<< HEAD
COMPONENT_PREP_ACTION =        ( cd $(@D) && autoreconf -fi )
=======
COMPONENT_PREP_ACTION =        ( cd $(@D)  && \
					autoreconf -fi)
>>>>>>> Add mate-power-manager 1.18.1

CONFIGURE_BINDIR.64=	/usr/bin
CONFIGURE_SBINDIR.64=	/usr/sbin

CONFIGURE_OPTIONS+=	--libexecdir=/usr/lib/mate
CONFIGURE_OPTIONS+=	--sysconfdir=/etc
# Needs library/gnome/gnome-keyring >= 3.0.0
CONFIGURE_OPTIONS+=	--without-keyring

CONFIGURE_ENV+= PYTHON="$(PYTHON)"
CONFIGURE_ENV+= PERL="$(PERL)"

<<<<<<< HEAD
=======
# common targets
>>>>>>> Add mate-power-manager 1.18.1
build:		$(BUILD_64)

install:	$(INSTALL_64)

test:		$(NO_TESTS)

<<<<<<< HEAD
# Auto-generated dependencies
=======
>>>>>>> Add mate-power-manager 1.18.1
REQUIRED_PACKAGES += desktop/mate/mate-panel
REQUIRED_PACKAGES += library/desktop/cairo
REQUIRED_PACKAGES += library/desktop/gdk-pixbuf
REQUIRED_PACKAGES += library/desktop/gtk3
REQUIRED_PACKAGES += library/desktop/pango
REQUIRED_PACKAGES += library/desktop/xdg/libcanberra
REQUIRED_PACKAGES += library/glib2
REQUIRED_PACKAGES += library/libnotify
REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += system/library/libdbus
REQUIRED_PACKAGES += system/library/libdbus-glib
REQUIRED_PACKAGES += system/library/math
REQUIRED_PACKAGES += system/upower
REQUIRED_PACKAGES += x11/library/libx11
REQUIRED_PACKAGES += x11/library/libxext
REQUIRED_PACKAGES += x11/library/libxrandr
