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
# Copyright 2018 Alexander Pyhalov
# Copyright 2021 Nona Hansel
#

BUILD_BITS=NO_ARCH
BUILD_STYLE=setup.py
PYTHON_ALL=yes
include ../../../make-rules/shared-macros.mk

COMPONENT_NAME= 	pexpect
COMPONENT_VERSION= 	4.6.0
COMPONENT_REVISION=	3
COMPONENT_PROJECT_URL=	https://github.com/pexpect/pexpect
COMPONENT_FMRI=	library/python/pexpect
COMPONENT_SRC= 		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE= 	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH= \
  sha256:2a8e88259839571d1251d278476f3eec5db26deb73a70be5ed5dc5435e418aba
COMPONENT_ARCHIVE_URL= \
  $(call pypi_url)
COMPONENT_CLASSIFICATION=Development/Python
COMPONENT_LICENSE=	ISC
COMPONENT_LICENSE_FILE=	LICENSE

TEST_TARGET=		$(NO_TESTS)
include $(WS_MAKE_RULES)/common.mk

# Auto-generated dependencies
REQUIRED_PACKAGES += runtime/python-27
REQUIRED_PACKAGES += runtime/python-35
REQUIRED_PACKAGES += runtime/python-37
REQUIRED_PACKAGES += runtime/python-39
