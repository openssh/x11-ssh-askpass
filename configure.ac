AC_INIT([x11-ssh-askpass],[1.2.4.1],[x11-ssh-askpass@dtucker.net])
AM_INIT_AUTOMAKE([foreign])
AC_CONFIG_HEADERS([config.h])
AC_PROG_CC
PKG_CHECK_MODULES([X11],[x11])
PKG_CHECK_MODULES([XT],[xt])
PKG_CHECK_MODULES([SM],[sm])
PKG_CHECK_MODULES([ICE],[ice])

AC_ARG_WITH([xinerama],
    [  --with-xinerama=yes|no  Enable/disable use of Xinerama],
    [
	with_xinerama="$withval"
    ]
)

if test "x$with_xinerama" != "xno"; then
	PKG_CHECK_MODULES([XINERAMA],[xinerama],
	    [AC_DEFINE([USE_XINERAMA], [1], [Use Xinerama])],
	    [if test "x$with_xinerama" = "xyes"; then
		AC_MSG_ERROR([Xinerama requested but not available])
	     fi
	    ]
	)
fi

AC_CHECK_FUNCS([explicit_bzero explicit_memset memset_s])
AC_SUBST(NAME,[x11-ssh-askpass])

APP_DEFAULTS_FILE=SshAskpass-default.ad
AC_ARG_WITH([app-defaults],
	[  --with-app-defaults=FILE
                          Specify X app-defaults file to use],
	[
		if test -z "$withval" ||
		    test "x$withval" = "xyes" ||
		    test "x$withval" = "xno"; then
			AC_MSG_ERROR([--with-app-defaults requires a filename])
		fi
		APP_DEFAULTS_FILE=$withval
	]
)
if test ! -f "$srcdir/$APP_DEFAULTS_FILE"; then
	AC_MSG_ERROR([app-defaults file '$APP_DEFAULTS_FILE' not found in source directory])
fi
AC_SUBST([APP_DEFAULTS_FILE])

APP_DEFAULTS_DIR='${sysconfdir}/X11/app-defaults'
AC_ARG_WITH([app-defaults-dir],
	[  --with-app-defaults-dir=DIR
                          Specify directory to install app-defaults file],
	[
		if test -z "$withval" ||
		    test "x$withval" = "xyes" ||
		    test "x$withval" = "xno"; then
			AC_MSG_ERROR([--with-app-defaults-dir requires a directory])
		fi
		APP_DEFAULTS_DIR=$withval
	]
)
AC_SUBST([APP_DEFAULTS_DIR])

install_app_defaults=yes
AC_ARG_ENABLE([installing-app-defaults],
	[  --disable-installing-app-defaults
                          Do not install the X app-defaults file],
	[
		if test "x$enableval" = "xno"; then
			install_app_defaults=no
		fi
	]
)
AM_CONDITIONAL([INSTALL_APP_DEFAULTS],
    [test "x$install_app_defaults" = "xyes"])

AC_CONFIG_FILES([Makefile x11-ssh-askpass.man])
AC_OUTPUT()
