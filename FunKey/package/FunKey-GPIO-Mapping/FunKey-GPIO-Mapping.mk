################################################################################
#
# FunKey-GPIO-mapping
#
################################################################################

FUNKEY_GPIO_MAPPING_VERSION = FunKey-0.99
FUNKEY_GPIO_MAPPING_SITE = $(call github,FunKey-Project,FunKey-GPIO-Mapping,FunKey-GPIO-Mapping-$(FUNKEY_GPIO_MAPPING_VERSION))
FUNKEY_GPIO_MAPPING_SITE_LICENSE = GPL-2.1+
FUNKEY_GPIO_MAPPING_SITE_LICENSE_FILES = COPYING

define FUNKEY_GPIO_MAPPING_BUILD_CMDS
	$(TARGET_MAKE_ENV) CROSS_COMPILE=$(TARGET_CROSS) \
		CC="$(TARGET_CC)" \
		$(MAKE) -C $(@D) \
		CFLAGS="$(TARGET_CFLAGS)" $(FUNKEY_GPIO_MAPPING_BUILD_TARGET)
endef

define FUNKEY_GPIO_MAPPING_INSTALL_TARGET_CMDS
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/local/sbin
	$(INSTALL) -m 0755 $(@D)/funkey_gpio_management $(TARGET_DIR)/usr/local/sbin/funkey_gpio_management
	$(INSTALL) -m 0755 $(@D)/termfix $(TARGET_DIR)/usr/local/sbin/termfix
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/init.d
	$(INSTALL) -m 0755 $(FUNKEY_GPIO_MAPPING_PKGDIR)etc/init.d/S11funkey-gpio-management $(TARGET_DIR)/etc/init.d/S11funkey-gpio-management
endef

$(eval $(generic-package))
