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
#   $WS_TOOLS/python-integrate-project typing_extensions
#

BUILD_STYLE = pyproject

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME =		typing_extensions
COMPONENT_VERSION =		4.4.0
COMPONENT_SUMMARY =		typing_extensions - Backported and Experimental Type Hints for Python 3.7+
COMPONENT_ARCHIVE_URL =		\
	https://files.pythonhosted.org/packages/e3/a7/8f4e456ef0adac43f452efc2d0e4b242ab831297f1bac60ac815d37eb9cf/typing_extensions-4.4.0.tar.gz
COMPONENT_ARCHIVE_HASH =	\
	sha256:1511434bb92bf8dd198c12b1cc812e800d4181cfcb867674e0f8279cc93087aa
COMPONENT_LICENSE =		PSF-2.0
COMPONENT_LICENSE_FILE =	LICENSE

# This component is required by following bootstrapped components so it must be
# bootstrapped too.
# - setuptools_scm
PYTHON_BOOTSTRAP = yes

# Disable tests because required packages are not available during bootstrap
TEST_STYLE = none

include $(WS_MAKE_RULES)/common.mk

# typing_extensions does not support setup.py build style so we cannot defer to
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
