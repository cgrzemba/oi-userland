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
# Copyright (c) 2015, 2017, Oracle and/or its affiliates. All rights reserved.
#

COMPONENT_NAME=		cyrus-sasl
#
# If you update the COMPONENT_VERSION, you should make a corresponding change
# in the dependency at the bottom of the openldap/openldap.p5m file.
#
COMPONENT_VERSION=	2.1.26
COMPONENT_PROJECT_URL=	ftp://ftp.cyrusimap.org/cyrus-sasl
COMPONENT_SRC = $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE_HASH=	\
    sha256:8fbc5136512b59bb793657f36fadda6359cae3b08f01fd16b3d406f1345b7bc3
COMPONENT_ARCHIVE = $(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_URL= $(COMPONENT_PROJECT_URL)/$(COMPONENT_ARCHIVE)
COMPONENT_ANITYA_ID=	13280

# Check DONOTUSE items when updating the version and hash
DONOTUSE= $(SOURCE_DIR)/mac  $(SOURCE_DIR)/dlcompat-20010505

COMPONENT_BUGDB=	library/libsasl

include ../../../make-rules/shared-macros.mk

SASL2.32 = $(USRLIBDIR)/sasl2
SASL2.64 = $(USRLIBDIR)/sasl2/$(MACH64)
SASL_CONFDIR = $(ETCDIR)/sasl2
PROTO_CONFDIR = $(PROTO_DIR)$(SASL_CONFDIR)

TEST_TARGET= $(NO_TESTS)

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/configure.mk
include $(WS_MAKE_RULES)/ips.mk

# This causes the default compilation argument to be wrong and isn't necessary.
studio_MT=

CPPFLAGS += -I$(USRINCDIR)/openldap
LDFLAGS += $(CC_BITS)  -lscf -lresolv

CONFIGURE_ENV += CPPFLAGS=$(CPPFLAGS)
CONFIGURE_OPTIONS += --sysconfdir=$(ETCDIR)
CONFIGURE_OPTIONS += --enable-auth-sasldb
CONFIGURE_OPTIONS += --with-saslauthd=/var/run/saslauthd
CONFIGURE_OPTIONS += --with-dblib=berkeley
CONFIGURE_OPTIONS += --with-gss_impl=mit
CONFIGURE_OPTIONS += --without-gnu-ld
CONFIGURE_OPTIONS.32 += --with-plugindir=$(SASL2.32)
CONFIGURE_OPTIONS.64 += --with-plugindir=$(SASL2.64)
CONFIGURE_OPTIONS.32 += --with-sasldir=$(SASL2.32)
CONFIGURE_OPTIONS.64 += --with-sasldir=$(SASL2.64)
CONFIGURE_OPTIONS += --with-ipctype=doors
CONFIGURE_OPTIONS += --with-ldap=$(USRDIR)
CONFIGURE_OPTIONS += --enable-sample
CONFIGURE_OPTIONS += --enable-login
CONFIGURE_OPTIONS += --with-configdir=$(ETCDIR)/sasl2
CONFIGURE_OPTIONS += --enable-ldapdb

PKG_PROTO_DIRS += $(SOURCE_DIR)/doc $(COMPONENT_DIR)/Solaris

LINTINCDIR= $(SOURCE_DIR)/include/sasl

INCLIST= hmac-md5.h \
	md5.h \
	md5global.h \
	prop.h \
	sasl.h \
	saslplug.h \
	saslutil.h

export CONFIG_SITE=$(WS_COMPONENTS)/$(COMPONENT_NAME)/Solaris/config.site

CFG_COMPILE=/usr/share/automake-1.15

COMPONENT_PREP_ACTION = ( cd $(@D) &&  \
		( cd config && ln -s $(CFG_COMPILE)/compile . ) ; \
		( cd saslauthd/config && ln -s $(CFG_COMPILE)/compile . ); \
		$(AUTORECONF) -m --force -v \
		-I $(COMPONENT_DIR)/m4   \
		-I $(SOURCE_DIR)/cmulocal \
		-I $(SOURCE_DIR)/config ; \
	    )

# Remove some things we don't use and aren't in the TPNO
# Make an include/sasl directory to make llib-lsasl2 match llib-lsasl2.ln
COMPONENT_PRE_CONFIGURE_ACTION = \
	-$(RM) -r $(DONOTUSE) ; \
	$(MKDIR) $(LINTINCDIR) ; \
	( cd $(LINTINCDIR) && \
	    ( for i in $(INCLIST) ; do \
	    	ln -s ../$$i $$i  ; \
	    done ) \
	)

# common targets
build: 	$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

COMPONENT_POST_BUILD_ACTION += \
    $(LD) -F libsasl2.so.3 $(LD_BITS) \
    -o $(BUILD_DIR_$(BITS))/lib/.libs/libsasl.so.1 \
    -G -hlibsasl.so.1 $(LD_B_DIRECT) $(LD_Z_DEFS) -M$(COMPONENT_DIR)/mapfile ; \
    (cd $(BUILD_DIR_$(BITS))/sample; $(ENV) $(COMPONENT_BUILD_ENV) \
    	$(MAKE) sample-client sample-server) ; \
    (cd $(BUILD_DIR_$(BITS))/utils; $(ENV) $(COMPONENT_BUILD_ENV) \
    	$(MAKE) testsuite) ;

COMPONENT_POST_INSTALL_ACTION += \
        $(CP) $(BUILD_DIR_$(BITS))/utils/.libs/testsuite \
		$(PROTO_DIR)/$(SASL2.$(BITS))/testsuite ; \
        $(CP) $(BUILD_DIR_$(BITS))/sample/.libs/sample-server \
		$(PROTO_DIR)/$(SASL2.$(BITS))/sample-server ; \
        $(CP) $(BUILD_DIR_$(BITS))/sample/.libs/sample-client \
		$(PROTO_DIR)/$(SASL2.$(BITS))/sample-client ;

COMPONENT_POST_INSTALL_ACTION.32 += \
        $(MKDIR) $(TESTS_DIR) ; \
        $(MKDIR) $(TESTS_32_DIR) ; \
        $(CP) $(BUILD_DIR_32)/utils/.libs/testsuite $(TESTS_32_DIR) ; \
        $(CP) $(BUILD_DIR_32)/sample/.libs/sample-server $(TESTS_32_DIR) ; \
        $(CP) $(BUILD_DIR_32)/sample/.libs/sample-client $(TESTS_32_DIR) ;

COMPONENT_POST_INSTALL_ACTION.64 += \
        $(MKDIR) $(TESTS_DIR) ; \
        $(CP) $(BUILD_DIR_64)/utils/.libs/testsuite $(TESTS_DIR) ; \
        $(CP) $(BUILD_DIR_64)/sample/.libs/sample-server $(TESTS_DIR) ; \
        $(CP) $(BUILD_DIR_64)/sample/.libs/sample-client $(TESTS_DIR) ;

REQUIRED_PACKAGES += archiver/gnu-tar
REQUIRED_PACKAGES += database/berkeleydb-5
REQUIRED_PACKAGES += developer/build/automake-115
REQUIRED_PACKAGES += library/security/openssl
REQUIRED_PACKAGES += security/kerberos-5
# REQUIRED_PACKAGES += system/network/ldap/openldap
REQUIRED_PACKAGES += library/openldap
