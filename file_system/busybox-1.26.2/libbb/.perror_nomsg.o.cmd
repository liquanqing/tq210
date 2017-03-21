cmd_libbb/perror_nomsg.o := arm-linux-gcc -Wp,-MD,libbb/.perror_nomsg.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BB_VER=KBUILD_STR(1.26.2)" -DBB_BT=AUTOCONF_TIMESTAMP  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Os     -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(perror_nomsg)"  -D"KBUILD_MODNAME=KBUILD_STR(perror_nomsg)" -c -o libbb/perror_nomsg.o libbb/perror_nomsg.c

deps_libbb/perror_nomsg.o := \
  libbb/perror_nomsg.c \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/stdc-predef.h \
  include/platform.h \
    $(wildcard include/config/werror.h) \
    $(wildcard include/config/big/endian.h) \
    $(wildcard include/config/little/endian.h) \
    $(wildcard include/config/nommu.h) \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/lib/gcc/arm-cortex_a8-linux-gnueabi/4.8.5/include-fixed/limits.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/lib/gcc/arm-cortex_a8-linux-gnueabi/4.8.5/include-fixed/syslimits.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/limits.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/features.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/sys/cdefs.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/wordsize.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/gnu/stubs.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/gnu/stubs-soft.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/posix1_lim.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/local_lim.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/linux/limits.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/posix2_lim.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/xopen_lim.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/stdio_lim.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/byteswap.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/byteswap.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/types.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/typesizes.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/byteswap-16.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/endian.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/endian.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/lib/gcc/arm-cortex_a8-linux-gnueabi/4.8.5/include/stdint.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/stdint.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/wchar.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/lib/gcc/arm-cortex_a8-linux-gnueabi/4.8.5/include/stdbool.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/unistd.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/posix_opt.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/environments.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/lib/gcc/arm-cortex_a8-linux-gnueabi/4.8.5/include/stddef.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/confname.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/getopt.h \

libbb/perror_nomsg.o: $(deps_libbb/perror_nomsg.o)

$(deps_libbb/perror_nomsg.o):
