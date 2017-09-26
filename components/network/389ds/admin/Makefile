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

COMPONENT_NAME=		389-admin
COMPONENT_VERSION=	1.1.46
COMPONENT_SRC = $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_PROJECT_URL=	http://directory.fedoraproject.org
COMPONENT_ARCHIVE_HASH= \
    sha256:6e1da6f8494bc6693cb50f77db448e3c3aa7cd96470f92ef95ed4b784e7b58fe
COMPONENT_ARCHIVE = $(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.bz2
COMPONENT_ARCHIVE_URL=	http://directory.fedoraproject.org/binaries/$(COMPONENT_ARCHIVE)
COMPONENT_BUGDB=	

BUILD_BITS= 64

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/configure.mk
include $(WS_MAKE_RULES)/ips.mk

PROTOSVCMANIFESTDIR = $(PROTOLIBDIR)/svc/manifest

# there should run apu-1-config also
CFLAGS += "-I/usr/apr-util/include"
LDFLAGS += -lsocket -lnsl

CONFIGURE_OPTIONS += --sysconfdir=/etc
CONFIGURE_OPTIONS += --localstatedir=/var
CONFIGURE_OPTIONS += --with-openldap-inc=$(USRINCDIR)/openldap
CONFIGURE_OPTIONS += --with-openldap-lib=$(USRLIBDIR)/$(MACH64)
CONFIGURE_OPTIONS += --with-sasl-inc=$(USRINCDIR)/sasl2 
CONFIGURE_OPTIONS += --with-sasl-lib=$(USRLIBDIR)/sasl2
CONFIGURE_OPTIONS += --with-nss-lib=$(USRLIBDIR)/mps/$(MACH64)
CONFIGURE_OPTIONS += --with-nss-inc=$(USRINCDIR)/mps
CONFIGURE_OPTIONS += --with-nspr-lib=$(USRLIBDIR)/mps/$(MACH64)
CONFIGURE_OPTIONS += --with-nspr-inc=$(USRINCDIR)/mps
CONFIGURE_OPTIONS += --with-apxs=/usr/apache2/2.4/bin/amd64/apxs
CONFIGURE_OPTIONS += --with-httpd=/usr/apache2/2.4/bin/amd64/httpd.worker
CONFIGURE_OPTIONS += --with-modnss-lib=/usr/apache2/2.4/libexec
CONFIGURE_OPTIONS += --with-modnss-bin=/usr/apache2/2.4/bin

COMPONENT_PRE_CONFIGURE_ACTION = \
	($(CLONEY) $(SOURCE_DIR) $(@D))

COMPONENT_PREP_ACTION = (cd $(@D) ; \
	aclocal --force; libtoolize --copy --force; \
	autoconf -f; \
	automake --add-missing --copy --force-missing)

build: $(BUILD_64)

install: $(INSTALL_64)

REQUIRED_PACKAGES += library/icu
REQUIRED_PACKAGES += library/security/nss
REQUIRED_PACKAGES += library/nspr
REQUIRED_PACKAGES += library/openldap
REQUIRED_PACKAGES += service/389-ds/389-adminutil
REQUIRED_PACKAGES += system/core-os
REQUIRED_PACKAGES += library/apr-util-15
REQUIRED_PACKAGES += runtime/perl-522
REQUIRED_PACKAGES += library/perl-5/netaddr-ip
# these will not included by build system, so it added in manifest too
REQUIRED_PACKAGES += library/perl-5/perldap
REQUIRED_PACKAGES += library/perl-5/netaddr-ip
REQUIRED_PACKAGES += web/server/apache-24/module/mod_nss
REQUIRED_PACKAGES += web/server/apache-24

