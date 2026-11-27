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

COMPONENT_NAME=		389-ds-base
COMPONENT_VERSION=	3.2.3
COMPONENT_GIT_TAG=      $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_SUMMARY=	389 Directory Server
COMPONENT_CLASSIFICATION= org.opensolaris.category.2008:System/Enterprise Management
COMPONENT_SRC = $(COMPONENT_NAME)-$(COMPONENT_GIT_TAG)
COMPONENT_PROJECT_URL=	https://port389.org
COMPONENT_ARCHIVE_HASH= \
    sha256:3a22d0448840f1e5ffcd88582aa1d2a12ed408f9dabf2e0e2645daf4cc991fd7
COMPONENT_ARCHIVE = $(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_URL=          https://github.com/389ds/$(COMPONENT_NAME)/archive/refs/tags/$(COMPONENT_GIT_TAG).tar.gz
COMPONENT_FMRI=		service/389-ds
COMPONENT_LICENSE=	GPLv3+
COMPONENT_LICENSE_FILE=	LICENSE

include $(WS_MAKE_RULES)/common.mk

# uses  __atomic_add_fetch_8
# unset LD_Z_IGNORE
LD_Z_IGNORE =

CONFIGURE_ENV +=	PYTHONPROG=$(PYTHON.$(BITS))
COMPONENT_BUILD_ENV += PKG_CONFIG_PATH=$(OPENSSL_PKG_CONFIG_PATH)
COMPONENT_BUILD_ENV += OPENSSL_DIR=$(OPENSSL_PREFIX)
COMPONENT_BUILD_ENV += OPENSSL_LIB_DIR=$(OPENSSL_LIBDIR)
COMPONENT_BUILD_ENV += OPENSSL_INCLUDE_DIR=$(OPENSSL_INCDIR)

CONFIGURE_OPTIONS += --with-localrundir=/var/run
CONFIGURE_OPTIONS += --with-openldap-inc=$(USRINCDIR)/openldap
CONFIGURE_OPTIONS += --with-openldap-lib=$(USRLIBDIR)/mps
CONFIGURE_OPTIONS += --with-openldap-bin=$(USRBINDIR)
# CONFIGURE_OPTIONS += --with-sasl-inc=$(USRINCDIR)/sasl2 
# CONFIGURE_OPTIONS += --with-sasl-lib=$(USRLIBDIR)/sasl2/$(MACH64)
# CONFIGURE_OPTIONS += --with-nss-lib=$(USRLIBDIR)/mps/$(MACH64)
# CONFIGURE_OPTIONS += --with-nss-inc=$(USRINCDIR)/mps
# CONFIGURE_OPTIONS += --with-nspr-lib=$(USRLIBDIR)/mps/$(MACH64)
# CONFIGURE_OPTIONS += --with-nspr-inc=$(USRINCDIR)/mps
# to satisfy pkgsend resolve
CONFIGURE_OPTIONS += --with-pythonexec=/usr/bin/python3
CONFIGURE_OPTIONS += --enable-debug
CONFIGURE_OPTIONS += --disable-dependency-tracking

# COMPONENT_PRE_CONFIGURE_ACTION = \
# 	($(CLONEY) $(SOURCE_DIR) $(@D))

COMPONENT_PREP_ACTION = ( \
	cd $(@D); \
		./autogen.sh; \
	)

PYTHON_SCRIPTS += usr/bin/ds-logpipe.py
PYTHON_SCRIPTS += usr/bin/logconv.py
PYTHON_SCRIPTS += usr/lib/$(MACH64)/dirsrv/python/failedbinds.py 
PYTHON_SCRIPTS += usr/lib/$(MACH64)/dirsrv/python/logregex.py
PYTHON_SCRIPTS += usr/share/gdb/auto-load/usr/sbin/ns-slapd-gdb.py
PYTHON_SCRIPTS += usr/bin/ds-replcheck

# Auto-generated dependencies
REQUIRED_PACKAGES += $(GCC_RUNTIME_PKG)
REQUIRED_PACKAGES += $(GXX_RUNTIME_PKG)
REQUIRED_PACKAGES += $(ICU_LIBRARY_PKG)
REQUIRED_PACKAGES += $(OPENSSL_PKG)
REQUIRED_PACKAGES += database/lmdb
REQUIRED_PACKAGES += developer/icu
REQUIRED_PACKAGES += library/json-c
REQUIRED_PACKAGES += library/nspr
REQUIRED_PACKAGES += library/openldap
REQUIRED_PACKAGES += library/pcre2
REQUIRED_PACKAGES += library/security/cracklib
REQUIRED_PACKAGES += library/security/openssl
REQUIRED_PACKAGES += library/zlib
REQUIRED_PACKAGES += runtime/perl
REQUIRED_PACKAGES += service/picl
REQUIRED_PACKAGES += service/security/kerberos-5
REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += system/library/math
REQUIRED_PACKAGES += system/library/mozilla-nss
REQUIRED_PACKAGES += system/library/security/libsasl2
REQUIRED_PACKAGES += system/management/snmp/net-snmp
REQUIRED_PACKAGES.python += runtime/python
