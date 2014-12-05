LOCAL_DIR := $(GET_LOCAL_DIR)

MEMBASE := 0x02700000 # SDRAM
MEMSIZE := 0x00900000 # 1MB

SCRATCH_ADDR     := 0x03000000

MACH_TYPE := 6577
HAVE_CACHE_PL310 := yes
LK_PROFILING := yes
MTK_FASTBOOT_SUPPORT := yes
# choose one of following value -> 1: disabled/ 2: permissive /3: enforcing
SELINUX_STATUS := 3

DEFINES += \
        MEMBASE=$(MEMBASE)\
	SCRATCH_ADDR=$(SCRATCH_ADDR)\
	MACH_TYPE=$(MACH_TYPE)\
	SELINUX_STATUS=$(SELINUX_STATUS)
        
ifeq ($(HAVE_CACHE_PL310), yes)
DEFINES += HAVE_CACHE_PL310
endif

ifeq ($(MTK_FASTBOOT_SUPPORT), yes)
DEFINES += MTK_FASTBOOT_SUPPORT
endif


ifeq ($(LK_PROFILING), yes)
DEFINES += LK_PROFILING
endif

ifeq ($(TARGET_BUILD_VARIANT),user)
DEFINES += USER_BUILD
endif 
ifeq ($(TARGET_BUILD_VARIANT),userdebug)
DEFINES += FASTBOOT_USERDEBUG
endif
