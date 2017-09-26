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

COMPONENT_NAME=         389-console
COMPONENT_VERSION=      1.1.18
COMPONENT_SRC =  $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_PROJECT_URL=  http://directory.fedoraproject.org
COMPONENT_ARCHIVE_HASH= \
    sha256:228c03d560328c82671ea3cfb2dad9dc0f16b100cfa024d0555e8658e94e4137
COMPONENT_ARCHIVE = $(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.bz2
COMPONENT_ARCHIVE_URL=  http://directory.fedoraproject.org/binaries/$(COMPONENT_ARCHIVE)
COMPONENT_BUGDB=

MAJOR_VERSION = $(basename $(COMPONENT_VERSION))

BUILD_BITS= NO_ARCH

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/ant.mk
include $(WS_MAKE_RULES)/ips.mk

# JAVA_HOME=/usr/jdk/instances/jdk1.7.0

COMPONENT_PRE_BUILD_ACTION = \
        ($(CLONEY) $(SOURCE_DIR) $(@D))

COMPONENT_INSTALL_ACTION = true

COMPONENT_POST_INSTALL_ACTION = \
	(         ginstall -d $(PROTOUSRSHARELIBDIR)/java; \
	ginstall -d $(PROTOUSRBINDIR); \
	gcp -fp $(@D)/built/$(COMPONENT_NAME)_en.jar $(PROTOUSRSHARELIBDIR)/java/$(COMPONENT_NAME)-$(COMPONENT_VERSION)_en.jar ; \
	ginstall -m 755 $(@D)/389-console $(PROTOUSRBINDIR) ; \
	( cd $(PROTOUSRSHARELIBDIR)/java ; \
		echo ln -s $(COMPONENT_NAME)-$(COMPONENT_VERSION)_en.jar $(COMPONENT_NAME)-$(MAJOR_VERSION)_en.jar ; \
		echo ln -s $(COMPONENT_NAME)-$(COMPONENT_VERSION)_en.jar $(COMPONENT_NAME)_en.jar ) ;\
	gsed -i -e 's+@jssjar@+$(USRSHARELIBDIR)/java/jss4.jar+' \
	        -e 's+@ldapjdkjar@+$(USRSHARELIBDIR)/java/ldapjdk.jar+' \
		-e 's+@basejar@+idm-console-base.jar+' \
		-e 's+@mccjar@+idm-console-mcc.jar+' \
		-e 's+@mcclangjar@+idm-console-mcc_en.jar+' \
		-e 's+@nmclfjar@+idm-console-nmclf.jar+' \
		-e 's+@nmclflangjar@+idm-console-nmclf_en.jar+' \
		-e 's+@themejar@+$(NAME)_en.jar+' \
		-e 's+@classdest@+$(USRSHARELIBDIR)/java+' \
		-e 's+@prefsdir@+389-console+' \
		-e 's+@USRLIB@+$(USRLIB)+' \
	$(PROTOUSRBINDIR)/389-console;  )

COMPOMENT_BUILD_ENV += JAVA_HOME=$(JAVA_HOME)

COMPONENT_BUILD_ARGS += -Dbuilt.dir=$(@D)/built
COMPONENT_BUILD_ARGS += -Dlib.dir=$(USRLIB)
COMPONENT_BUILD_ARGS += -Dclassdest=$(USRSHARELIBDIR)
COMPONENT_BUILD_ARGS += -Dldapjdk.local.location=$(USRSHARELIBDIR)/java 
COMPONENT_BUILD_ARGS += -Djss.local.location=$(USRSHARELIBDIR)/java
COMPONENT_BUILD_ARGS += -Dman.dir=$(USRSHAREMANDIR)
COMPONENT_BUILD_ARGS += -Dconsole.local.location=$(USRSHARELIBDIR)/java 

# COMPONENT_BUILD_TARGETS =      
COMPONENT_INSTALL_TARGETS =      build
COMPONENT_INSTALL_ARGS = $(COMPONENT_BUILD_ARGS)

build: $(BUILD_32)

install: $(INSTALL_32)

REQUIRED_PACKAGES += library/java/ldap-sdk
REQUIRED_PACKAGES += library/java/libjss4
REQUIRED_PACKAGES += library/java/idm-console-framework
