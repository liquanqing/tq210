cmd_loginutils/sulogin.o := arm-linux-gcc -Wp,-MD,loginutils/.sulogin.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BB_VER=KBUILD_STR(1.26.2)" -DBB_BT=AUTOCONF_TIMESTAMP  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Os     -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(sulogin)"  -D"KBUILD_MODNAME=KBUILD_STR(sulogin)" -c -o loginutils/sulogin.o loginutils/sulogin.c

deps_loginutils/sulogin.o := \
  loginutils/sulogin.c \
    $(wildcard include/config/sulogin.h) \
    $(wildcard include/config/selinux.h) \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/stdc-predef.h \
  include/libbb.h \
    $(wildcard include/config/feature/shadowpasswds.h) \
    $(wildcard include/config/use/bb/shadow.h) \
    $(wildcard include/config/feature/utmp.h) \
    $(wildcard include/config/locale/support.h) \
    $(wildcard include/config/use/bb/pwd/grp.h) \
    $(wildcard include/config/lfs.h) \
    $(wildcard include/config/feature/buffers/go/on/stack.h) \
    $(wildcard include/config/feature/buffers/go/in/bss.h) \
    $(wildcard include/config/feature/verbose.h) \
    $(wildcard include/config/feature/ipv6.h) \
    $(wildcard include/config/feature/seamless/xz.h) \
    $(wildcard include/config/feature/seamless/lzma.h) \
    $(wildcard include/config/feature/seamless/bz2.h) \
    $(wildcard include/config/feature/seamless/gz.h) \
    $(wildcard include/config/feature/seamless/z.h) \
    $(wildcard include/config/feature/check/names.h) \
    $(wildcard include/config/feature/prefer/applets.h) \
    $(wildcard include/config/long/opts.h) \
    $(wildcard include/config/feature/getopt/long.h) \
    $(wildcard include/config/feature/pidfile.h) \
    $(wildcard include/config/feature/syslog.h) \
    $(wildcard include/config/feature/individual.h) \
    $(wildcard include/config/echo.h) \
    $(wildcard include/config/printf.h) \
    $(wildcard include/config/test.h) \
    $(wildcard include/config/test1.h) \
    $(wildcard include/config/test2.h) \
    $(wildcard include/config/kill.h) \
    $(wildcard include/config/killall.h) \
    $(wildcard include/config/killall5.h) \
    $(wildcard include/config/chown.h) \
    $(wildcard include/config/ls.h) \
    $(wildcard include/config/xxx.h) \
    $(wildcard include/config/route.h) \
    $(wildcard include/config/feature/hwib.h) \
    $(wildcard include/config/desktop.h) \
    $(wildcard include/config/feature/crond/d.h) \
    $(wildcard include/config/use/bb/crypt.h) \
    $(wildcard include/config/feature/adduser/to/group.h) \
    $(wildcard include/config/feature/del/user/from/group.h) \
    $(wildcard include/config/ioctl/hex2str/error.h) \
    $(wildcard include/config/feature/editing.h) \
    $(wildcard include/config/feature/editing/history.h) \
    $(wildcard include/config/feature/editing/savehistory.h) \
    $(wildcard include/config/feature/tab/completion.h) \
    $(wildcard include/config/feature/username/completion.h) \
    $(wildcard include/config/feature/editing/vi.h) \
    $(wildcard include/config/feature/editing/save/on/exit.h) \
    $(wildcard include/config/pmap.h) \
    $(wildcard include/config/feature/show/threads.h) \
    $(wildcard include/config/feature/ps/additional/columns.h) \
    $(wildcard include/config/feature/topmem.h) \
    $(wildcard include/config/feature/top/smp/process.h) \
    $(wildcard include/config/pgrep.h) \
    $(wildcard include/config/pkill.h) \
    $(wildcard include/config/pidof.h) \
    $(wildcard include/config/sestatus.h) \
    $(wildcard include/config/unicode/support.h) \
    $(wildcard include/config/feature/mtab/support.h) \
    $(wildcard include/config/feature/clean/up.h) \
    $(wildcard include/config/feature/devfs.h) \
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
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/ctype.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/xlocale.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/dirent.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/dirent.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/errno.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/errno.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/linux/errno.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/asm/errno.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/asm-generic/errno.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/asm-generic/errno-base.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/fcntl.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/fcntl.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/fcntl-linux.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/uio.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/sys/types.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/time.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/sys/select.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/select.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/sigset.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/time.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/sys/sysmacros.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/pthreadtypes.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/stat.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/inttypes.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/netdb.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/netinet/in.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/sys/socket.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/sys/uio.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/socket.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/socket_type.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/sockaddr.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/asm/socket.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/asm-generic/socket.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/asm/sockios.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/asm-generic/sockios.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/in.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/rpc/netdb.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/siginfo.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/netdb.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/setjmp.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/setjmp.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/signal.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/signum.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/sigaction.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/sigcontext.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/asm/sigcontext.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/sigstack.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/sys/ucontext.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/sigthread.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/paths.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/stdio.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/libio.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/_G_config.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/wchar.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/lib/gcc/arm-cortex_a8-linux-gnueabi/4.8.5/include/stdarg.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/sys_errlist.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/stdlib.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/waitflags.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/waitstatus.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/alloca.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/stdlib-float.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/string.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/libgen.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/poll.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/sys/poll.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/poll.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/sys/ioctl.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/ioctls.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/asm/ioctls.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/asm-generic/ioctls.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/linux/ioctl.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/asm/ioctl.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/asm-generic/ioctl.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/ioctl-types.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/sys/ttydefaults.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/sys/mman.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/mman.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/mman-linux.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/sys/stat.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/sys/time.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/sys/wait.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/termios.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/termios.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/timex.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/sys/param.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/param.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/linux/param.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/asm/param.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/asm-generic/param.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/pwd.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/grp.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/mntent.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/sys/statfs.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/statfs.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/utmp.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/utmp.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/utmpx.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/utmpx.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/arpa/inet.h \
  include/pwd_.h \
  include/grp_.h \
  include/shadow_.h \
  include/xatonum.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/syslog.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/sys/syslog.h \
  /opt/arm-cortex_a8-linux-gnueabi-4.8/arm-cortex_a8-linux-gnueabi/sysroot/usr/include/bits/syslog-path.h \

loginutils/sulogin.o: $(deps_loginutils/sulogin.o)

$(deps_loginutils/sulogin.o):
