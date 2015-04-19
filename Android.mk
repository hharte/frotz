LOCAL_PATH:= $(call my-dir)
# prebuilt libncurses
include $(CLEAR_VARS)

LOCAL_MODULE := ncurses
LOCAL_SRC_FILES := ../../android-libncurses/libs/$(TARGET_ARCH_ABI)/libncurses.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../include/

include $(PREBUILT_SHARED_LIBRARY)

#========================== frotz ====================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	src/blorb/blorblib.c \
	src/common/buffer.c \
	src/common/err.c \
	src/common/fastmem.c \
	src/common/files.c \
	src/common/getopt.c \
	src/common/hotkey.c \
	src/common/input.c \
	src/common/main.c \
	src/common/math.c \
	src/common/object.c \
	src/common/process.c \
	src/common/quetzal.c \
	src/common/random.c \
	src/common/redirect.c \
	src/common/screen.c \
	src/common/sound.c \
	src/common/stream.c \
	src/common/table.c \
	src/common/text.c \
	src/common/variable.c \
	src/curses/ux_audio_none.c \
	src/curses/ux_audio_oss.c \
	src/curses/ux_file.c \
	src/curses/ux_init.c \
	src/curses/ux_input.c \
	src/curses/ux_pic.c \
	src/curses/ux_screen.c \
	src/curses/ux_text.c
#	src/dumb/dumb_init.c \
#	src/dumb/dumb_input.c \
#	src/dumb/dumb_output.c \
#	src/dumb/dumb_pic.c



LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/. \
	$(LOCAL_PATH)/src/common \
	../android-libncurses/jni/include
#	bionic/libc/private \
#	libc/kernel/common

LOCAL_CFLAGS := \
	-std=gnu99 \
	-Werror=implicit

LOCAL_MODULE := frotz
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES += libncurses libc
#LOCAL_FORCE_STATIC_EXECUTABLE := true

CONFIG_DIR := /data/local
VERSION := 2.43-android
LOCAL_CFLAGS += -DCONFIG_DIR="\"$(CONFIG_DIR)\"" $(CURSES_DEF) \
        -DVERSION="\"$(VERSION)\""

include $(BUILD_EXECUTABLE)
