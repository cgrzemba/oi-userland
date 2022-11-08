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
# This file was automatically generated using the following command:
#   $WS_TOOLS/python-integrate-project build
#

BUILD_STYLE = pyproject

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME =		build
COMPONENT_VERSION =		0.9.0
COMPONENT_SUMMARY =		build - A simple, correct PEP 517 build frontend
COMPONENT_ARCHIVE_URL =		\
	https://files.pythonhosted.org/packages/0f/61/aaf43fbb36cc4308be8ac8088f52db9622b0dbf1f0880c1016ae6aa03f46/build-0.9.0.tar.gz
COMPONENT_ARCHIVE_HASH =	\
	sha256:1a07724e891cbd898923145eb7752ee7653674c511378eb9c7691aab1612bc3c
COMPONENT_LICENSE =		MIT
COMPONENT_LICENSE_FILE =	LICENSE

# Since we cannot use the 'build' package to build itself we need to bootstrap.
# To do so we will use pyproject_installer to get PEP 376 compliant
# installation.  The other possible way to bootstrap the 'build' package is
# setup.py, but its results are not PEP 376 compliant.
PYTHON_BOOTSTRAP = yes

# Disable tests because required packages are not available during bootstrap
TEST_STYLE = none

include $(WS_MAKE_RULES)/common.mk

# Use pyproject_installer to build this project
#
# Since pyproject_installer requires Python >= 3.8 we need to defer to default
# setup.py build style for Python 3.7, so we will use pyproject_installer for
# Python 3.9 only.  Once we obsolete Python 3.7 we should set
# COMPONENT_BUILD_CMD and COMPONENT_BUILD_ARGS unconditionally below.
$(BUILD_DIR)/%-3.9/.built:	COMPONENT_BUILD_CMD =		$(PYTHON.3.9) -m pyproject_installer build
$(BUILD_DIR)/%-3.9/.built:	COMPONENT_BUILD_ARGS =

# Use pyproject_installer to install this project
#
# Since pyproject_installer requires Python >= 3.8 we need to defer to default
# setup.py build style for Python 3.7, so we will use pyproject_installer for
# Python 3.9 only.  Once we obsolete Python 3.7 we should set
# COMPONENT_INSTALL_CMD and COMPONENT_INSTALL_ARGS unconditionally below.
$(BUILD_DIR)/%-3.9/.installed:	COMPONENT_INSTALL_CMD =		$(PYTHON.3.9) -m pyproject_installer install
$(BUILD_DIR)/%-3.9/.installed:	COMPONENT_INSTALL_ARGS =
$(BUILD_DIR)/%-3.9/.installed:	COMPONENT_INSTALL_ARGS +=	--destdir $(PROTO_DIR)

# pyproject_installer does not bytecompile after the install.  Since we need
# pyc files we need to force that.
#
# Since pyproject_installer requires Python >= 3.8 we need to defer to default
# setup.py build style for Python 3.7, and so we do not need to compile for
# Python 3.7.  Once we obsolete Python 3.7 we should set
# COMPONENT_POST_INSTALL_ACTION unconditionally below.
$(BUILD_DIR)/%-3.9/.installed:	COMPONENT_POST_INSTALL_ACTION +=	$(PYTHON) -m compileall $(PROTO_DIR)/$(PYTHON_LIB) ;

# We need pyproject_installer
# Once we obsolete Python 3.7 this should be changed to
# PYTHON_USERLAND_REQUIRED_PACKAGES and '-39' suffix should be removed
USERLAND_REQUIRED_PACKAGES += library/python/pyproject_installer-39

# Auto-generated dependencies
PYTHON_REQUIRED_PACKAGES += library/python/importlib_metadata
PYTHON_REQUIRED_PACKAGES += library/python/setuptools
PYTHON_REQUIRED_PACKAGES += runtime/python
