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
# Copyright 2018	cgrzemba@opencsw.org
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME= 	genshi
COMPONENT_SRCNAME= 	Genshi
COMPONENT_VERSION= 	0.7
COMPONENT_FMRI= 	library/python/genshi
COMPONENT_SRC= 		$(COMPONENT_SRCNAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE= 	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH= \
  sha256:1d154402e68bc444a55bcac101f96cb4e59373100cc7a2da07fbf3e5cc5d7352
COMPONENT_ARCHIVE_URL= \
  http://ftp.edgewall.com/pub/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)
COMPONENT_PROJECT_URL =  http://genshi.edgewall.org/
COMPONENT_CLASSIFICATION= Development/Python
COMPONENT_SUMMARY= 	HTTP-Python
COMPONENT_LICENSE= 	BSD
COMPONENT_LICENSE_FILE  = COPYING

PYTHON_VERSIONS=	2.7

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/setup.py.mk
include $(WS_MAKE_RULES)/ips.mk


build: $(BUILD_NO_ARCH)

install: $(INSTALL_NO_ARCH)


REQUIRED_PACKAGES += runtime/python-27
