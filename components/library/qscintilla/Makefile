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
# Copyright 2023 Niklas Poslovski
#

# BUILD_STYLE= justmake
include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=         qscintilla
COMPONENT_VERSION=      2.14.2
COMPONENT_SUMMARY=      Scintilla C++ editor class for Qt5
COMPONENT_PROJECT_URL=  http://www.riverbankcomputing.com/software/qscintilla/
COMPONENT_SRC=          QScintilla_src-2.14.2.dev2507081610
COMPONENT_ARCHIVE=      $(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH= sha256:bf872a83a1d8a35409950fad6463099421170635bf1175ae5a466f0a2bafeea5
COMPONENT_ARCHIVE_URL=  https://www.riverbankcomputing.com/static/Downloads/QScintilla/$(COMPONENT_ARCHIVE)
COMPONENT_FMRI=         library/qt5/qscintilla
COMPONENT_CLASSIFICATION= Desktop (GNOME)/Libraries
COMPONENT_LICENSE=      GPLv3
COMPONENT_LICENSE_FILE= LICENSE

include $(WS_MAKE_RULES)/common.mk

PATH = $(PATH.gnu):$(QT5_BINDIR)

# BUILD_DIRS=	src
# COMPONENT_CONFIGURE_ACTION = \
# cd ${WRKSRC}/src && ${QTDIR}/bin/qmake -o Makefile qscintilla.pro
CLONEY_MODE = copy
COMPONENT_SUBDIR= src
CONFIG_SHELL = 
CONFIGURE_SCRIPT = $(QT5_BINDIR)/qmake
CONFIGURE_OPTIONS = -o Makefile qscintilla.pro

COMPONENT_INSTALL_ARGS +=      INSTALL_ROOT="$(PROTO_DIR)"

TEST_TARGET= $(NO_TESTS)

CMAKE_OPTIONS += -DQt5_DIR=$(QT5_LIBDIR)/cmake/Qt5

# Manually added build dependencies

# Auto-generated dependencies
REQUIRED_PACKAGES += $(GCC_RUNTIME_PKG)
REQUIRED_PACKAGES += $(GXX_RUNTIME_PKG)
REQUIRED_PACKAGES += library/qt5
REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += system/library/math
