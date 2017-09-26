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

COMPONENT_NAME=         perldap
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
HG_HASH = sha256:6d902f0d8aebf11ded4f44e3d842aca84e343b007bb07889d008d79c41d81af5

COPYRIGHTS = MPL
COPYRIGHT_FILE = COPYING

BUILD_BITS= 32

PERL_VERSIONS = 5.22

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/makemaker.mk
include $(WS_MAKE_RULES)/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = \
 	cd $(@D)/perldap; find . | cpio -pmdv .. 

COMPONENT_BUILD_ENV += LDAPSDKINCDIR=/usr/include/mps/ldap
COMPONENT_BUILD_ENV += LDAPSDKLIBDIR=/usr/lib/mps
COMPONENT_BUILD_ENV += LDAPSDKSSL=Y
COMPONENT_BUILD_ENV += LDAPPR=Y
COMPONENT_BUILD_ENV += NSPRINCDIR=/usr/include/mps
COMPONENT_BUILD_ENV += NSPRLIBDIR=/usr/lib/mps
COMPONENT_BUILD_ENV += NSSLIBDIR=/usr/lib/mps

COMPONENT_BUILD_ARGS += PASTHRU_INC="$(CC_BITS) -I/usr/include/mps/ldap -I/usr/include/mps"
COMPONENT_BUILD_ARGS += LDLOADLIBS="$(CC_BITS) -L/usr/lib/mps -lldap60"
COMPONENT_BUILD_ARGS += LD_RUN_PATH="/usr/lib/mps"
COMPONENT_BUILD_ARGS += OPTIMIZE="-O4"

COMPONENT_CONFIGURE_ENV += LDAPSDKDIR=/usr
COMPONENT_CONFIGURE_ENV += LDAPSDKSSL=Y
COMPONENT_CONFIGURE_ENV += LDAPV30N=Y
COMPONENT_CONFIGURE_ENV += $(COMPONENT_BUILD_ENV)
CONFIGURE_OPTIONS += PREFIX=/usr
CONFIGURE_OPTIONS += INSTALLDIRS=vendor
CONFIGURE_OPTIONS += < /dev/null

COMPONENT_INSTALL_ARGS += INSTALLARCHLIB=/usr/perl5/5.22/lib/i86pc-solaris-64int
COMPONENT_INSTALL_ARGS += INSTALLVENDORARCH=/usr/perl5/vendor_perl/5.22/i86pc-solaris-64int

build: $(BUILD_32)

install: $(INSTALL_32)

include $(WS_MAKE_RULES)/depend.mk

REQUIRED_PACKAGES += library/mozldap
