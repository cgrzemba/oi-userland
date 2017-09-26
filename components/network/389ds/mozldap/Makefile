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

#
# Copyright (c) 2017, cgrzemba@opencsw.org
#

include ../../../../make-rules/shared-macros.mk

COMPONENT_NAME=         ldap-csdk
COMPONENT_VERSION=      6.0.7
COMPONENT_PROJECT_URL=  http://developer.mozilla.org
# COMPONENT_ARCHIVE_HASH= \
#     sha256:228c03d560328c82671ea3cfb2dad9dc0f16b100cfa024d0555e8658e94e4137
# COMPONENT_ARCHIVE = $(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.bz2
# COMPONENT_ARCHIVE_URL=  http:///$(COMPONENT_ARCHIVE)
COMPONENT_SRC = $(COMPONENT_NAME)-$(HG_REV)
COMPONENT_BUGDB=

HG_REV=c07685b0f90a
HG_REPO=https://hg.mozilla.org/projects/ldap-sdks
HG_HASH = sha256:4f7fbe43e86e7a9575ff114c80e23877ee3bc8a594caf5bcb6f3db0280c0ebba

COPYRIGHTS = MPL
COPYRIGHT_FILE = COPYING

BARCH = $(if $(filter 64,$(BITS)),/$(MACH64))

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/configure.mk
include $(WS_TOP)/make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = \
          ($(CLONEY) $(SOURCE_DIR)/c-sdk $(@D); cd $(@D) && autoreconf-2.13 -f; echo)

#          ($(CLONEY) $(SOURCE_DIR)/c-sdk $(@D); cd $(@D) && autoreconf-2.13 -f; echo)

COMPONENT_POST_INSTALL_ACTION = \
	( ginstall -d $(PROTOUSRLIBDIR)/mps$(BARCH); \
	  ginstall -d $(PROTOUSRDIR)/include/mps/; \
	  cd $(BUILD_DIR)/stage; \
	  (cd public; gcp -rpL ldap $(PROTOUSRDIR)/include/mps/; ); \
	  (cd bin; ginstall * $(PROTOUSRLIBDIR)/mps$(BARCH); ) )

CONFIGURE_OPTIONS  = --prefix=$(CONFIGURE_PREFIX)
ifeq ($(CONFIGURE_DEFAULT_DIRS),yes)
CONFIGURE_OPTIONS += --mandir=$(CONFIGURE_MANDIR)
CONFIGURE_OPTIONS += --bindir=$(CONFIGURE_BINDIR.$(BITS))
CONFIGURE_OPTIONS += --libdir=$(CONFIGURE_LIBDIR.$(BITS))
CONFIGURE_OPTIONS += --sbindir=$(CONFIGURE_SBINDIR.$(BITS))
endif
CONFIGURE_OPTIONS.64 += --enable-64bit
CONFIGURE_OPTIONS += --with-svrcore=/usr/lib$(BARCH)
CONFIGURE_OPTIONS += --with-nss-lib=/usr/lib/mps$(BARCH)
CONFIGURE_OPTIONS += --with-nss-inc=/usr/include/mps
CONFIGURE_OPTIONS += --with-nspr-inc=/usr/include/mps
CONFIGURE_OPTIONS += --with-nspr-lib=/usr/lib/mps$(BARCH)
CONFIGURE_OPTIONS += --with-sasl2-lib=/usr/lib/sasl2$(BARCH)
CONFIGURE_OPTIONS += --with-sasl2-include=/usr/include/sasl2
CONFIGURE_OPTIONS += --with-dist-prefix=$(BUILD_DIR)/stage
CONFIGURE_OPTIONS += $(CONFIGURE_OPTIONS.$(BITS))

CONFIGURE_SCRIPT =     $(SOURCE_DIR)/c-sdk/configure

COMPONENT_BUILD_ARGS = BARCH=$(BARCH)

build:	$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

include $(WS_TOP)/make-rules/depend.mk

REQUIRED_PACKAGES += library/security/nss
REQUIRED_PACKAGES += library/nspr
REQUIRED_PACKAGES += library/svrcore
