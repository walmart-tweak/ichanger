THEOS_DEVICE_IP = 192.168.11.119
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = iChanger
iChanger_FILES = Tweak.xm 
include $(THEOS_MAKE_PATH)/tweak.mk
iChanger_LIBRARIES = applist

after-install::
	install.exec "killall -9 SpringBoard"
