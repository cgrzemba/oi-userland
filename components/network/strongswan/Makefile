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
# Copyright 2017, cgrzemba@opencsw.org
#
include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		strongswan
COMPONENT_VERSION=	5.6.0
COMPONENT_REVISION=	1
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.bz2
COMPONENT_FMRI=		network/$(COMPONENT_NAME)
COMPONENT_CLASSIFICATION=	Applications/Internet
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_PROJECT_URL=	http://www.strongswan.org/
COMPONENT_ARCHIVE_HASH=	\
	sha256:a14dc0d92634ed52730bfc76a76db30943a28ed3c65a560066e1e9f785827b13
COMPONENT_ARCHIVE_URL=https://download.strongswan.org/$(COMPONENT_ARCHIVE)
COMPONENT_LICENSE=		GPLv2.1
COMPONENT_LICENSE_FILE= COPYING
COMPONENT_SUMMARY=	OpenSource IPsec-based VPN Solution

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/configure.mk
include $(WS_MAKE_RULES)/ips.mk

COMPONENT_PREP_ACTION = \
        (cd $(@D) &&\
        autoreconf -fiv &&\
        $(RM) config.h )

CFLAGS += -D_POSIX_PTHREAD_SEMANTICS 
LDFLAGS += $(LD_Z_IGNORE) -lnsl -lsocket

CONFIGURE_OPTIONS += PLUGIN_CFLAGS=-I/usr/include/openldap
CONFIGURE_OPTIONS += --sysconfdir=$(ETCDIR)
CONFIGURE_OPTIONS += --localstatedir=$(VARDIR)
CONFIGURE_OPTIONS.64 += --libexecdir=/usr/libexec/$(MACH64)
CONFIGURE_OPTIONS += --disable-kernel-netlink
CONFIGURE_OPTIONS += --enable-file
CONFIGURE_OPTIONS += --enable-sqlite
CONFIGURE_OPTIONS += --enable-soup
CONFIGURE_OPTIONS += --enable-curl
CONFIGURE_OPTIONS += --enable-ldap
# CONFIGURE_OPTIONS += --enable-tkm
CONFIGURE_OPTIONS += --enable-radattr
CONFIGURE_OPTIONS += --enable-lookip
CONFIGURE_OPTIONS += --disable-gmp --enable-openssl
CONFIGURE_OPTIONS += --disable-scripts
CONFIGURE_OPTIONS += --enable-kernel-pfroute
CONFIGURE_OPTIONS += --enable-kernel-pfkey
# alternatives for enable-kernel-pf's
# CONFIGURE_OPTIONS += --enable-kernel-libipsec

build: $(BUILD_32_and_64)

install: $(INSTALL_32_and_64)

$(TEST_$(BITS)): $(BUILD_$(BITS))
	cd $(BUILD_DIR_$(BITS)) && $(MAKE) check
	$(TOUCH) $@

test: $(TEST_32_and_64)

REQUIRED_PACKAGES += SUNWcs
REQUIRED_PACKAGES += system/library
REQUIRED_PACKAGES += library/security/openssl
REQUIRED_PACKAGES += library/security/libp11
REQUIRED_PACKAGES += library/desktop/p11-kit
REQUIRED_PACKAGES += system/library/security/gss
REQUIRED_PACKAGES += driver/network/header-tun
REQUIRED_PACKAGES += driver/network/header-tap
