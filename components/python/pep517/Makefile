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
#   $WS_TOOLS/python-integrate-project pep517
#

BUILD_STYLE = pyproject

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME =		pep517
COMPONENT_VERSION =		0.13.0
COMPONENT_SUMMARY =		pep517 - Wrappers to build Python packages using PEP 517 hooks
COMPONENT_PROJECT_URL =		https://github.com/pypa/pep517
COMPONENT_ARCHIVE_URL =		\
	https://files.pythonhosted.org/packages/4d/19/e11fcc88288f68ae48e3aa9cf5a6fd092a88e629cb723465666c44d487a0/pep517-0.13.0.tar.gz
COMPONENT_ARCHIVE_HASH =	\
	sha256:ae69927c5c172be1add9203726d4b84cf3ebad1edcd5f71fcdc746e66e829f59
COMPONENT_LICENSE =		MIT
COMPONENT_LICENSE_FILE =	LICENSE

# This component is required by following bootstrapped components so it must be
# bootstrapped too.
# - build
PYTHON_BOOTSTRAP = yes

# Disable tests because required packages are not available during bootstrap
TEST_STYLE = none

include $(WS_MAKE_RULES)/common.mk

# This components does not support setup.py build style so we cannot defer to
# it for bootstrapping Python 3.7.  Use 'build' and 'installer' instead
# (because pyproject_installer does not support Python 3.7).  Strictly speaking
# this is not true bootstrap, but since we do not need to bootstrap Python 3.7
# from scratch we can afford this fake bootstrap keeping in mind that Python
# 3.7 should be EOLed in June 2023.
$(BUILD_DIR)/%-3.7/.built:	COMPONENT_BUILD_CMD =		$(PYTHON) -m build
$(BUILD_DIR)/%-3.7/.built:	COMPONENT_BUILD_ARGS =
$(BUILD_DIR)/%-3.7/.built:	COMPONENT_BUILD_ARGS +=		--wheel
$(BUILD_DIR)/%-3.7/.built:	COMPONENT_BUILD_ARGS +=		--no-isolation

$(BUILD_DIR)/%-3.7/.installed:	COMPONENT_INSTALL_CMD =		$(PYTHON) -m installer
$(BUILD_DIR)/%-3.7/.installed:	COMPONENT_INSTALL_ARGS =
$(BUILD_DIR)/%-3.7/.installed:	COMPONENT_INSTALL_ARGS +=	--destdir $(PROTO_DIR)
$(BUILD_DIR)/%-3.7/.installed:	COMPONENT_INSTALL_ARGS +=	$(@D)/dist/*.whl

USERLAND_REQUIRED_PACKAGES += library/python/build-37
USERLAND_REQUIRED_PACKAGES += library/python/installer-37

BOOTSTRAP_TRANSFORMS =

# Auto-generated dependencies
PYTHON_REQUIRED_PACKAGES += library/python/flit-core
