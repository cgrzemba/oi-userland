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

COMPONENT_NAME=		389-adminutil
COMPONENT_VERSION=	1.1.23
COMPONENT_SRC  = $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_PROJECT_URL=	http://directory.fedoraproject.org
COMPONENT_ARCHIVE_HASH= \
    sha256:d5844b95a8bec9fb5e677e4b5c78489959386fd73d061f13b2096159c0726fec
COMPONENT_ARCHIVE = $(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.bz2
COMPONENT_ARCHIVE_URL=	http://directory.fedoraproject.org/binaries/$(COMPONENT_ARCHIVE)
COMPONENT_BUGDB=	

BUILD_BITS= 64

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/configure.mk
include $(WS_MAKE_RULES)/ips.mk

CONFIGURE_OPTIONS += --with-openldap-inc=$(USRINCDIR)/openldap
CONFIGURE_OPTIONS += --with-openldap-lib=$(USRLIBDIR)/$(MACH64)
CONFIGURE_OPTIONS += --with-sasl-inc=$(USRINCDIR)/sasl2 
CONFIGURE_OPTIONS += --with-nss-lib=$(USRLIBDIR)/mps/$(MACH64)
CONFIGURE_OPTIONS += --with-nss-inc=$(USRINCDIR)/mps
CONFIGURE_OPTIONS += --with-nspr-lib=$(USRLIBDIR)/mps/$(MACH64)
CONFIGURE_OPTIONS += --with-nspr-inc=$(USRINCDIR)/mps

COMPONENT_PRE_CONFIGURE_ACTION = \
	($(CLONEY) $(SOURCE_DIR) $(@D))

COMPONENT_PREP_ACTION = (cd $(@D) ; \
	aclocal --force; libtoolize --copy --force; \
	autoheader --force; \
	autoconf -f; \
	automake --add-missing --copy --force-missing)

# common targets
build:          $(BUILD_64)

install:        $(INSTALL_64)

test:   $(NO_TESTS)

REQUIRED_PACKAGES += library/security/openssl
REQUIRED_PACKAGES += library/icu
REQUIRED_PACKAGES += library/security/nss
REQUIRED_PACKAGES += library/nspr
REQUIRED_PACKAGES += library/svrcore
REQUIRED_PACKAGES += library/libsasl2
REQUIRED_PACKAGES += library/openldap
