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

include ../../../../make-rules/shared-macros.mk

COMPONENT_NAME=		svrcore
COMPONENT_VERSION=	4.0.4
COMPONENT_PROJECT_URL=	http://developer.mozilla.org
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE_HASH= \
    sha256:4772fb4705492de11f10d3e020f0ceca2541415c009ae5444988d6becca36a58
COMPONENT_ARCHIVE = $(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.bz2
COMPONENT_ARCHIVE_URL=http://ftp.mozilla.org/pub/directory/svrcore/releases/4.0.4/src/$(COMPONENT_ARCHIVE)
COMPONENT_BUGDB=	

COPYRIGHT_FILE = LICENSE
COPYRIGHTS = MPL

BUILD_BITS= 64

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/configure.mk
include $(WS_MAKE_RULES)/ips.mk


LD_OPTIONS += -R/usr/lib/mps/$(MACH64)

CONFIGURE_OPTIONS += --with-nss-inc=/usr/include/mps
CONFIGURE_OPTIONS += --with-nss-lib=/usr/lib/mps/$(MACH64)
CONFIGURE_OPTIONS += --with-nspr-inc=/usr/include/mps
CONFIGURE_OPTIONS += --with-nspr-lib=/usr/lib/mps/$(MACH64)
CONFIGURE_OPTIONS += --enable-64bit

# common targets
build:		$(BUILD_64)

install:	$(INSTALL_64)

test:		$(NO_TESTS)

REQUIRED_PACKAGES += library/security/nss
