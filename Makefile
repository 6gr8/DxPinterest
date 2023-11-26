INSTALL_TARGET_PROCESSES = SpringBoard
export THEOS=/var/jb/var/mobile/theos
THEOS_PACKAGE_SCHEME=rootless


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = dxApps

dxApps_FILES = Tweak.x
dxApps_CFLAGS = -fobjc-arc
dxApps_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

