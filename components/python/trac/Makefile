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
# Copyright (c) 2013, Oracle and/or its affiliates. All rights reserved.
#
include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		Trac
COMPONENT_VERSION=	1.2.2
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	\
    sha256:5ddeca9d2d47093f5791ef7e38ec9aff9c911258b8ba94c85a32ccd9274fc3b6
COMPONENT_PROJECT_URL=  http://trac.edgewall.org
COMPONENT_ARCHIVE_URL=	https://download.edgewall.org/$(shell  echo $(COMPONENT_NAME) | tr A-Z a-z)/$(COMPONENT_ARCHIVE)
COMPONENT_BUGDB=	python-mod/trac
COMPONENT_SUMMARY = "web-based_software_project_management"
COMPONENT_FMRI	= library/python/trac
COMPONENT_CLASSIFICATION= Development/Python
COMPONENT_LICENSE = BSD
COMPONENT_LICENSE_FILE = COPYING


PYTHON_VERSIONS=2.7

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/setup.py.mk
include $(WS_TOP)/make-rules/ips.mk

COMPONENT_BUILD_ENV =

# common targets
build:		$(BUILD_NO_ARCH)

install:	$(INSTALL_NO_ARCH)

REQUIRED_PACKAGES += runtime/python-27
