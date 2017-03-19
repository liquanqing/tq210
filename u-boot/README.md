# uboot

##u-boot建立过程
解压u-boot代码后，进入文件夹可以看到README文件，最好详细看一下里面说的东西，  
非常有用的。
README里介绍，在使用某个板子某个CPU之前，先要进行配置。  
For all supported boards there are ready-to-use default
configurations available; just type "make <board_name>_defconfig".

Example: For a TQM823L module type:

	cd u-boot
	make TQM823L_defconfig

新版u-boot提供SPL（second program loader），如果要使用，需要声明宏：  
CONFIG_SPL_FRAMEWORK

配置选项，一般都在对应板名头文件，例如：  
Example: For a TQM823L module, all configuration settings are in
"include/configs/TQM823L.h".
README里也详细介绍了各配置。单单配置介绍，占用了README文件的一半了。

然后是板级初始化设置，里面也有详细介绍，这里就不多说了！


终于滚到建立软件工程了。
首先需要声明交叉编译器（ARCH不用么？）
然后输入make 《NAME》_defconfig
然后输入make all
最后生成一个uboot.bin uboot(image in ELF binary format)

当然文件中也介绍了如果要新增一个cpu如何做
1.  Create a new directory to hold your board specific code. Add any
    files you need. In your board directory, you will need at least
    the "Makefile" and a "<board>.c".
2.  Create a new configuration file "include/configs/<board>.h" for
    your board.
3.  If you're porting U-Boot to a new CPU, then also create a new
    directory to hold your CPU specific code. Add any files you need.
4.  Run "make <board>_defconfig" with your new name.
5.  Type "make", and you should get a working "u-boot.srec" file
    to be installed on your target system.
6.  Debug and solve any problems that might arise.
    [Of course, this last step is much harder than it sounds.]

另外，uboot需要识别uImage的linux内核镜像，zImage和bzmage都是不支持的。
编译内核的时候，可以直接make uImage，也可以使用uboot生成的mkimage工具。

看完uboot的README，基本知道要怎么编译，下面要看一下他的MAKEFILE。
上面说，第一步我们先 make xxxx_defconfig ，所以，以这个为线索分析Makefile，看看能得到什么信息。
打开Makefile，先记录下他定义的这些变量，后面肯定会用到
1、MAKEFLAGS += -rR --include-dir=$(CURDIR)
2、以下语句是判定 V 是不是被命令行定义过，如果是，KBUILD_VERBOSE就等于这个V变量的值，如果没有定义过
   KBUILD_VERBOSE，那么就设置KBUILD_VERBOSE为0，如果这个变量为1,那么现实命令，否则隐藏命令（README是这么说的）
   如果我们要使用这个，在make的时候在后面加上 V=1

ifeq ("$(origin V)", "command line")
  KBUILD_VERBOSE = $(V)
endif
ifndef KBUILD_VERBOSE
  KBUILD_VERBOSE = 0
endif

ifeq ($(KBUILD_VERBOSE),1)
  quiet =
  Q =
else
  quiet=quiet_
  Q = @
endif

3、下面几行用于定义输出文件夹，如果需要，在make后面加上O=xxxxx
ifeq ($(KBUILD_SRC),)

# OK, Make called in directory where kernel src resides
# Do we want to locate output files in a separate directory?
ifeq ("$(origin O)", "command line")
  KBUILD_OUTPUT := $(O)
endif

4、以下变量用得上
objtree		:= .
src		:= $(srctree)
obj		:= $(objtree)

5、识别环境
HOSTARCH := $(shell uname -m | \
	sed -e s/i.86/x86/ \
	    -e s/sun4u/sparc64/ \
	    -e s/arm.*/arm/ \
	    -e s/sa110/arm/ \
	    -e s/ppc64/powerpc/ \
	    -e s/ppc/powerpc/ \
	    -e s/macppc/powerpc/\
	    -e s/sh.*/sh/)

HOSTOS := $(shell uname -s | tr '[:upper:]' '[:lower:]' | \
	    sed -e 's/\(cygwin\).*/cygwin/')

export	HOSTARCH HOSTOS

6、定义交叉编译器， 这里根据上面的环境架构来定义对应的交叉编译器。
    所以我在定义环境的时候，需要更改这里，在后面加上
    ARCH=arm 
    CROSS_COMPILE = arm-linux-gnueabi-
ifeq ($(HOSTARCH),$(ARCH))
CROSS_COMPILE ?=
endif



7、这里目测有点眉目，关于config,但是我们要找的是xxxx_defconfig
KBUILD_DEFCONFIG := sandbox_defconfig
export KBUILD_DEFCONFIG KBUILD_KCONFIG

config: scripts_basic outputmakefile FORCE
	$(Q)$(MAKE) $(build)=scripts/kconfig $@

%config: scripts_basic outputmakefile FORCE
	$(Q)$(MAKE) $(build)=scripts/kconfig $@

else
# ===========================================================================
# Build targets only - this includes vmlinux, arch specific targets, clean
# targets and others. In general all targets except *config targets.

ifeq ($(dot-config),1)
# Read in config
-include include/config/auto.conf

# Read in dependencies to all Kconfig* files, make sure to run
# oldconfig if changes are detected.
-include include/config/auto.conf.cmd

# To avoid any implicit rule to kick in, define an empty command
$(KCONFIG_CONFIG) include/config/auto.conf.cmd: ;

# If .config is newer than include/config/auto.conf, someone tinkered
# with it and forgot to run make oldconfig.
# if auto.conf.cmd is missing then we are probably in a cleaned tree so
# we execute the config step to be sure to catch updated Kconfig files
include/config/%.conf: $(KCONFIG_CONFIG) include/config/auto.conf.cmd
	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
	@# If the following part fails, include/config/auto.conf should be
	@# deleted so "make silentoldconfig" will be re-run on the next build.
	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.autoconf || \
		{ rm -f include/config/auto.conf; false; }
	@# include/config.h has been updated after "make silentoldconfig".
	@# We need to touch include/config/auto.conf so it gets newer
	@# than include/config.h.
	@# Otherwise, 'make silentoldconfig' would be invoked twice.
	$(Q)touch include/config/auto.conf

-include include/autoconf.mk
-include include/autoconf.mk.dep

# We want to include arch/$(ARCH)/config.mk only when include/config/auto.conf
# is up-to-date. When we switch to a different board configuration, old CONFIG
# macros are still remaining in include/config/auto.conf. Without the following
# gimmick, wrong config.mk would be included leading nasty warnings/errors.
ifneq ($(wildcard $(KCONFIG_CONFIG)),)
ifneq ($(wildcard include/config/auto.conf),)
autoconf_is_old := $(shell find . -path ./$(KCONFIG_CONFIG) -newer \
						include/config/auto.conf)
ifeq ($(autoconf_is_old),)
include config.mk
include arch/$(ARCH)/Makefile
endif
endif
endif

8、这里绝对用得上，是生成uboot所需要的构件

libs-y += lib/
libs-$(HAVE_VENDOR_COMMON_LIB) += board/$(VENDOR)/common/
libs-$(CONFIG_OF_EMBED) += dts/
libs-y += fs/
libs-y += net/
libs-y += disk/
libs-y += drivers/
libs-y += drivers/dma/
libs-y += drivers/gpio/
libs-y += drivers/i2c/
libs-y += drivers/mmc/
libs-y += drivers/mtd/
libs-$(CONFIG_CMD_NAND) += drivers/mtd/nand/
libs-y += drivers/mtd/onenand/
libs-$(CONFIG_CMD_UBI) += drivers/mtd/ubi/
libs-y += drivers/mtd/spi/
libs-y += drivers/net/
libs-y += drivers/net/phy/
libs-y += drivers/pci/
libs-y += drivers/power/ \
	drivers/power/domain/ \
	drivers/power/fuel_gauge/ \
	drivers/power/mfd/ \
	drivers/power/pmic/ \
	drivers/power/battery/ \
	drivers/power/regulator/
libs-y += drivers/spi/
libs-$(CONFIG_FMAN_ENET) += drivers/net/fm/
libs-$(CONFIG_SYS_FSL_DDR) += drivers/ddr/fsl/
libs-$(CONFIG_SYS_FSL_MMDC) += drivers/ddr/fsl/
libs-$(CONFIG_ALTERA_SDRAM) += drivers/ddr/altera/
libs-y += drivers/serial/
libs-y += drivers/usb/dwc3/
libs-y += drivers/usb/common/
libs-y += drivers/usb/emul/
libs-y += drivers/usb/eth/
libs-y += drivers/usb/gadget/
libs-y += drivers/usb/gadget/udc/
libs-y += drivers/usb/host/
libs-y += drivers/usb/musb/
libs-y += drivers/usb/musb-new/
libs-y += drivers/usb/phy/
libs-y += drivers/usb/ulpi/
libs-y += cmd/
libs-y += common/
libs-$(CONFIG_API) += api/
libs-$(CONFIG_HAS_POST) += post/
libs-y += test/
libs-y += test/dm/
libs-$(CONFIG_UT_ENV) += test/env/
libs-$(CONFIG_UT_OVERLAY) += test/overlay/

libs-y += $(if $(BOARDDIR),board/$(BOARDDIR)/)

libs-y := $(sort $(libs-y))

u-boot-dirs	:= $(patsubst %/,%,$(filter %/, $(libs-y))) tools examples

u-boot-alldirs	:= $(sort $(u-boot-dirs) $(patsubst %/,%,$(filter %/, $(libs-))))

libs-y		:= $(patsubst %/, %/built-in.o, $(libs-y))

u-boot-init := $(head-y)
u-boot-main := $(libs-y)

9、这里也同样是构件

# Always append ALL so that arch config.mk's can add custom ones
ALL-y += u-boot.srec u-boot.bin u-boot.sym System.map binary_size_check

ALL-$(CONFIG_ONENAND_U_BOOT) += u-boot-onenand.bin
ifeq ($(CONFIG_SPL_FSL_PBL),y)
ALL-$(CONFIG_RAMBOOT_PBL) += u-boot-with-spl-pbl.bin
else
ifneq ($(CONFIG_SECURE_BOOT), y)
# For Secure Boot The Image needs to be signed and Header must also
# be included. So The image has to be built explicitly
ALL-$(CONFIG_RAMBOOT_PBL) += u-boot.pbl
endif
endif
ALL-$(CONFIG_SPL) += spl/u-boot-spl.bin
ifeq ($(CONFIG_MX6)$(CONFIG_SECURE_BOOT), yy)
ALL-$(CONFIG_SPL_FRAMEWORK) += u-boot-ivt.img
else
ALL-$(CONFIG_SPL_FRAMEWORK) += u-boot.img
endif
ALL-$(CONFIG_TPL) += tpl/u-boot-tpl.bin
ALL-$(CONFIG_OF_SEPARATE) += u-boot.dtb
ifeq ($(CONFIG_SPL_FRAMEWORK),y)
ALL-$(CONFIG_OF_SEPARATE) += u-boot-dtb.img
endif
ALL-$(CONFIG_OF_HOSTFILE) += u-boot.dtb
ifneq ($(CONFIG_SPL_TARGET),)
ALL-$(CONFIG_SPL) += $(CONFIG_SPL_TARGET:"%"=%)
endif
ALL-$(CONFIG_REMAKE_ELF) += u-boot.elf
ALL-$(CONFIG_EFI_APP) += u-boot-app.efi
ALL-$(CONFIG_EFI_STUB) += u-boot-payload.efi

ifneq ($(BUILD_ROM),)
ALL-$(CONFIG_X86_RESET_VECTOR) += u-boot.rom
endif

# enable combined SPL/u-boot/dtb rules for tegra
ifeq ($(CONFIG_TEGRA)$(CONFIG_SPL),yy)
ALL-y += u-boot-tegra.bin u-boot-nodtb-tegra.bin
ALL-$(CONFIG_OF_SEPARATE) += u-boot-dtb-tegra.bin
endif

# Add optional build target if defined in board/cpu/soc headers
ifneq ($(CONFIG_BUILD_TARGET),)
ALL-y += $(CONFIG_BUILD_TARGET:"%"=%)
endif

LDFLAGS_u-boot += $(LDFLAGS_FINAL)
ifneq ($(CONFIG_SYS_TEXT_BASE),)
LDFLAGS_u-boot += -Ttext $(CONFIG_SYS_TEXT_BASE)
endif

10、这里找到最后的make all规则了，但是还没是分析他的时候，我们要找xxxx_defconfig

cfg: u-boot.cfg

all:		$(ALL-y)
ifeq ($(CONFIG_DM_I2C_COMPAT)$(CONFIG_SANDBOX),y)
	@echo "===================== WARNING ======================"
	@echo "This board uses CONFIG_DM_I2C_COMPAT. Please remove"
	@echo "(possibly in a subsequent patch in your series)"
	@echo "before sending patches to the mailing list."
	@echo "===================================================="
endif
	@# Check that this build does not use CONFIG options that we do not
	@# know about unless they are in Kconfig. All the existing CONFIG
	@# options are whitelisted, so new ones should not be added.
	$(srctree)/scripts/check-config.sh u-boot.cfg \
		$(srctree)/scripts/config_whitelist.txt ${srctree} 1>&2
PHONY += dtbs
dtbs: dts/dt.dtb
	@:
dts/dt.dtb: checkdtc u-boot
	$(Q)$(MAKE) $(build)=dts dtbs

quiet_cmd_copy = COPY    $@
      cmd_copy = cp $< $@

ifeq ($(CONFIG_OF_SEPARATE),y)
u-boot-dtb.bin: u-boot-nodtb.bin dts/dt.dtb FORCE
	$(call if_changed,cat)

u-boot.bin: u-boot-dtb.bin FORCE
	$(call if_changed,copy)
else
u-boot.bin: u-boot-nodtb.bin FORCE
	$(call if_changed,copy)
endif

%.imx: %.bin
	$(Q)$(MAKE) $(build)=arch/arm/imx-common $@

%.vyb: %.imx
	$(Q)$(MAKE) $(build)=arch/arm/cpu/armv7/vf610 $@

quiet_cmd_copy = COPY    $@
      cmd_copy = cp $< $@

u-boot.dtb: dts/dt.dtb
	$(call cmd,copy)

OBJCOPYFLAGS_u-boot.hex := -O ihex

OBJCOPYFLAGS_u-boot.srec := -O srec

u-boot.hex u-boot.srec: u-boot FORCE
	$(call if_changed,objcopy)

OBJCOPYFLAGS_u-boot-nodtb.bin := -O binary \
		$(if $(CONFIG_X86_RESET_VECTOR),-R .start16 -R .resetvec)

binary_size_check: u-boot-nodtb.bin FORCE
	@file_size=$(shell wc -c u-boot-nodtb.bin | awk '{print $$1}') ; \
	map_size=$(shell cat u-boot.map | \
		awk '/_image_copy_start/ {start = $$1} /_image_binary_end/ {end = $$1} END {if (start != "" && end != "") print "ibase=16; " toupper(end) " - " toupper(start)}' \
		| sed 's/0X//g' \
		| bc); \
	if [ "" != "$$map_size" ]; then \
		if test $$map_size -ne $$file_size; then \
			echo "u-boot.map shows a binary size of $$map_size" >&2 ; \
			echo "  but u-boot-nodtb.bin shows $$file_size" >&2 ; \
			exit 1; \
		fi \
	fi

u-boot-nodtb.bin: u-boot FORCE
	$(call if_changed,objcopy)
	$(call DO_STATIC_RELA,$<,$@,$(CONFIG_SYS_TEXT_BASE))
	$(BOARD_SIZE_CHECK)

u-boot.ldr:	u-boot
		$(CREATE_LDR_ENV)
		$(LDR) -T $(CONFIG_CPU) -c $@ $< $(LDR_FLAGS)
		$(BOARD_SIZE_CHECK)

# binman
# ---------------------------------------------------------------------------
quiet_cmd_binman = BINMAN  $@
cmd_binman = $(srctree)/tools/binman/binman -d u-boot.dtb -O . \
		-I . -I $(srctree)/board/$(BOARDDIR) $<

OBJCOPYFLAGS_u-boot.ldr.hex := -I binary -O ihex

OBJCOPYFLAGS_u-boot.ldr.srec := -I binary -O srec

u-boot.ldr.hex u-boot.ldr.srec: u-boot.ldr FORCE
	$(call if_changed,objcopy)


这就尴尬了，找了整个Makefile都没有找到xxxx_defconfig，但是上面可以找到%config，那么就以这个为线索来分析好了。

%config: scripts_basic outputmakefile FORCE
	$(Q)$(MAKE) $(build)=scripts/kconfig $@
展开之后 看到是执行了scripts/kconfig下的文件来生成这个config,那看来，我们一开始不是输入defconfig，而是应该  
输入make xxxx_config了

# Basic helpers built in scripts/
PHONY += scripts_basic
scripts_basic:
	$(Q)$(MAKE) $(build)=scripts/basic
	$(Q)rm -f .tmp_quiet_recordmcount

# To avoid any implicit rule to kick in, define an empty command.
scripts/basic/%: scripts_basic ;

PHONY += outputmakefile
# outputmakefile generates a Makefile in the output directory, if using a
# separate output directory. This allows convenient use of make in the
# output directory.
outputmakefile:
ifneq ($(KBUILD_SRC),)
	$(Q)ln -fsn $(srctree) source
	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkmakefile \
	    $(srctree) $(objtree) $(VERSION) $(PATCHLEVEL)
endif

%config依赖scripts_basic 和 outputmakefile
先看scripts_basic

hostprogs-y	:= fixdep
always		:= $(hostprogs-y)

# fixdep is needed to compile other host programs
$(addprefix $(obj)/,$(filter-out fixdep,$(always))): $(obj)/fixdep

没什么营养，看一下outputmakefile先
也没有什么营养，悲催了，不管，先看一下scripts下面的kconfig
郁闷了，难道分析错误？不管，再看一下顶层makefile，看看有什么头绪。
草泥马了，在scripts/kconfig 下面找到关键信息了！
%_defconfig: $(obj)/conf
	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)

# Added for U-Boot (backward compatibility)
%_config: %_defconfig
	@:


耍赖使用默认的make TQM823L_defconfig和make TQM823L_config效果是一样的，这样更加验证了是执行上面这个代码了

从上面看，要生成这个defconfig，是需要obj下的conf，但是没有发现这个，那么这个conf也是生成的，kconfig文件夹下  
有conf.c和h文件，估计就是先编译生成conf，然后执行conf把defconfig生成kconfig了！

因为用make xxxdefconfig之后，会产生一个打印信息，
#
# configuration written in .config
#

这个信息出现在confdata.c中conf_write函数中
所以更确定了上面的分析了！

尝试分析一下scriph下kconfig下的conf的代码！
第一个是直接找main，在conf.c中有main，分析看看
第一个是main的参数 argc和 *argv[]
argc代表多少个参数输入，包括了对象本身
例如：hello.c a b
argc = 3
argv[0] = hello.c
argv[1] = a
argv[2] = b

就是这样
首先获取参数opt，defconfig
然后读取defconfig文件
最后写入到.config文件

Makefile 编译 
首先寻找all
all:		$(ALL-y)
ifeq ($(CONFIG_DM_I2C_COMPAT)$(CONFIG_SANDBOX),y)
	@echo "===================== WARNING ======================"
	@echo "This board uses CONFIG_DM_I2C_COMPAT. Please remove"
	@echo "(possibly in a subsequent patch in your series)"
	@echo "before sending patches to the mailing list."
	@echo "===================================================="
endif
	@# Check that this build does not use CONFIG options that we do not
	@# know about unless they are in Kconfig. All the existing CONFIG
	@# options are whitelisted, so new ones should not be added.
	$(srctree)/scripts/check-config.sh u-boot.cfg \
		$(srctree)/scripts/config_whitelist.txt ${srctree} 1>&2

看这里是使用check-config.sh u-boot.cfg config_whitelist.txt 1>&2

check-config.sh又是什么鬼
path="$1"
whitelist="$2"
srctree="$3"
sh文件里获取输入参数
path = u-boot.cfg
whitelist = config_whitelist.txt
srctree = srctree

# Temporary files
configs="${path}.configs"
suspects="${path}.suspects"
ok="${path}.ok"
new_adhoc="${path}.adhoc"

configs = u-boot.cfg.configs
suspects = u-boot.cfg.suspects
ok = u-boot.cfg.ok
new_adhoc = u-boot.cfg.adhoc

看完之后没有看见生成什么关键文件
那么看一下all的依赖文件吧
可以看到，全部目标文件都是all-y这个构件里的东西

# Always append ALL so that arch config.mk's can add custom ones
ALL-y += u-boot.srec u-boot.bin u-boot.sym System.map binary_size_check

ALL-$(CONFIG_ONENAND_U_BOOT) += u-boot-onenand.bin
ifeq ($(CONFIG_SPL_FSL_PBL),y)
ALL-$(CONFIG_RAMBOOT_PBL) += u-boot-with-spl-pbl.bin
else
ifneq ($(CONFIG_SECURE_BOOT), y)
# For Secure Boot The Image needs to be signed and Header must also
# be included. So The image has to be built explicitly
ALL-$(CONFIG_RAMBOOT_PBL) += u-boot.pbl
endif
endif
ALL-$(CONFIG_SPL) += spl/u-boot-spl.bin
ifeq ($(CONFIG_MX6)$(CONFIG_SECURE_BOOT), yy)
ALL-$(CONFIG_SPL_FRAMEWORK) += u-boot-ivt.img
else
ALL-$(CONFIG_SPL_FRAMEWORK) += u-boot.img
endif
ALL-$(CONFIG_TPL) += tpl/u-boot-tpl.bin
ALL-$(CONFIG_OF_SEPARATE) += u-boot.dtb
ifeq ($(CONFIG_SPL_FRAMEWORK),y)
ALL-$(CONFIG_OF_SEPARATE) += u-boot-dtb.img
endif
ALL-$(CONFIG_OF_HOSTFILE) += u-boot.dtb
ifneq ($(CONFIG_SPL_TARGET),)
ALL-$(CONFIG_SPL) += $(CONFIG_SPL_TARGET:"%"=%)
endif
ALL-$(CONFIG_REMAKE_ELF) += u-boot.elf
ALL-$(CONFIG_EFI_APP) += u-boot-app.efi
ALL-$(CONFIG_EFI_STUB) += u-boot-payload.efi

ifneq ($(BUILD_ROM),)
ALL-$(CONFIG_X86_RESET_VECTOR) += u-boot.rom
endif

# enable combined SPL/u-boot/dtb rules for tegra
ifeq ($(CONFIG_TEGRA)$(CONFIG_SPL),yy)
ALL-y += u-boot-tegra.bin u-boot-nodtb-tegra.bin
ALL-$(CONFIG_OF_SEPARATE) += u-boot-dtb-tegra.bin
endif

# Add optional build target if defined in board/cpu/soc headers
ifneq ($(CONFIG_BUILD_TARGET),)
ALL-y += $(CONFIG_BUILD_TARGET:"%"=%)
endif

LDFLAGS_u-boot += $(LDFLAGS_FINAL)
ifneq ($(CONFIG_SYS_TEXT_BASE),)
LDFLAGS_u-boot += -Ttext $(CONFIG_SYS_TEXT_BASE)
endif

可以看出，因为我们的是a8,需要spl就要定义一个CONFIG_SPL
还有一个很关键的变量是CONFIG_SYS_TEXT_BASE 这个是定义代码段基地址
从Makefile中看，最终生成u-boot.bin,而u-boot.bin依赖u-boot，u-boot依赖u-boot-init，u-boot-main和u-boot.lds
u-boot-init = head-y
u-boot-main = libs-y
head-y没东西
libs-y包括所有的lib插件drive等



#移植
1, 将board/samsung/smdkc100 拷贝一份并命名tq210
进入tq210文件夹
把smdkc100.c改成tq210.c
修改Makefile，把smdkc100.o 改成 tq210.o
修改Kconfig成如下
if TARGET_TQ210

config SYS_BOARD
	default "tq210"

config SYS_VENDOR
	default "samsung"

config SYS_SOC
	default "s5pv210"

config SYS_CONFIG_NAME
	default "tq210"

endi

修改MAINTAINERS成如下：
TQ210 BOARD
M:	Inc
S:	Maintained
F:	board/samsung/tq210/
F:	include/configs/tq210.h
F:	configs/tq210_defconfi

根据MAINTAINERS的信息
复制include/configs/smdkc100.h 为include/configs/tq210.h
复制configs/smdkc100_defconfig 为configs/tq210_defconfig

修改tq210_defconfig成如下
CONFIG_ARM=y
CONFIG_ARCH_S5PV210=y
CONFIG_TARGET_TQ210=y
CONFIG_IDENT_STRING=" for TQ210"
# CONFIG_MMC is not set
CONFIG_DEFAULT_DEVICE_TREE="s5pv210-tq210"
CONFIG_BOOTDELAY=3
CONFIG_HUSH_PARSER=y
CONFIG_SYS_PROMPT="TQ210 # "
# CONFIG_CMD_IMLS is not set
# CONFIG_CMD_FLASH is not set
# CONFIG_CMD_SETEXPR is not set
CONFIG_CMD_CACHE=y
CONFIG_CMD_FAT=

进入arch/arm, 找到S5PC1XX的信息，模仿修改为S5PV210
config ARCH_S5PV210
	bool "Samsung S5PV210"
	select CPU_V7
	select DM
	select DM_SERIAL
	select DM_GPI

source "arch/arm/mach-s5pv210/Kconfig

把s5pv210编译进uboot，修改arch/arm 下的Makefile
machine-$(CONFIG_ARCH_S5PV210) 		+= s5pv21

复制mach-s5pc1xx为mach-s5pv210
修改ach-s5pv210下的Kconfig
if ARCH_S5PV210

choice
	prompt "S5PV210 board select"
	optional

#config TARGET_S5P_GONI
#	bool "S5P Goni board"
#	select OF_CONTROL

config TARGET_TQ210
	bool "Support tq210 board"
	select OF_CONTROL

endchoice

config SYS_SOC
	default "s5pv210"

#source "board/samsung/goni/Kconfig"
source "board/samsung/tq210/Kconfig"

endi

进入include/mach/
修改cpu.h，增加s5pv210d的寄存器信息
#define S5PV210_PRO_ID          0xE0000000
#define S5PV210_CLOCK_BASE      0xE0100000
#define S5PV210_GPIO_BASE       0xE0200000
#define S5PV210_SROMC_BASE      0xE8000000
#define S5PV210_DMC0_BASE       0xF0000000
#define S5PV210_DMC1_BASE       0xF1400000
#define S5PV210_VIC0_BASE       0xF2000000
#define S5PV210_VIC1_BASE       0xF2100000
#define S5PV210_VIC2_BASE       0xF2200000
#define S5PV210_VIC3_BASE       0xF2300000
#define S5PV210_NAND_BASE       0xB0E00000
#define S5PV210_WATCHDOG_BASE   0xE2700000
#define S5PV210_MMC_BASE        0xEB000000
#define S5PV210_PWMTIMER_BASE   0xE2500000
#define S5PV210_UART_BASE       0xE290000

并修改/board/samsung/tq210下的lowlevel_init.S，
把里面的S5PC100全部替换成S5PV210
回到arch/arm/cpu/armv7/下，修改Makefile
ifneq (,$(filter s5pv210 s5pc1xx exynos,$(SOC)))                                            ~
 obj-y += s5p-common/                                                                        ~
endif  

复制/arch/arm/dts/s5pc1xx-smdkc100.dts 为/arch/arm/dts/s5pv210-tq210.dts
并且修改此目录下的Makefile，加上s5pv210-tq210.dts的设备树文件
dtb-$(CONFIG_S5PV210) += s5pv210-tq210.dt

将include/configs/tq210.h文件里的CONFIG_S5PC100改成CONFIG_S5PV210
在scripts/下的config_whitelist.txt文件里添加CONFIG_S5PV210这个宏
最后编译

编译u-boot-spl.bin
在mach-s5pv210下的kconfig文件里添加select SUPPORT_SPL
config TARGET_TQ210
	bool "Support tq210 board"
	select OF_CONTROL
    select SUPPORT_SPL

在configs/tq210_defconfig文件里添加CONFIG_SPL=y

编译提示board_init_f未定义
这个函数用于初始化一些操作，而spl只需要初始化时钟和ddr，然后调用拷贝函数之后跳转就可以了！
所以这个可以在spl中不调用！














