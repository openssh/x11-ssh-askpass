AUTOMAKE_OPTIONS = subdir-objects
libexec_PROGRAMS = x11-ssh-askpass
x11_ssh_askpass_SOURCES = drawing.c dynlist.c resources.c x11-ssh-askpass.c
x11_ssh_askpass_SOURCES += drawing.h dynlist.h resources.h x11-ssh-askpass.h
x11_ssh_askpass_SOURCES += includes.h openbsd-compat/explicit_bzero.c
nodist_x11_ssh_askpass_SOURCES = SshAskpass_ad.h
x11_ssh_askpass_CFLAGS = $(X11_CFLAGS) $(XT_CFLAGS) $(SM_CFLAGS) $(ICE_CFLAGS) $(XINERAMA_CFLAGS)
x11_ssh_askpass_LDADD = $(X11_LIBS) $(XT_LIBS) $(SM_LIBS) $(ICE_LIBS) $(XINERAMA_LIBS)

APP_DEFAULTS_FILE = @APP_DEFAULTS_FILE@
askpassconfdir = @APP_DEFAULTS_DIR@
if INSTALL_APP_DEFAULTS
askpassconf_DATA = SshAskpass
endif

CLEANFILES = SshAskpass_ad.h x11-ssh-askpass.1x SshAskpass
man1_MANS = x11-ssh-askpass.1x
BUILT_SOURCES = SshAskpass_ad.h x11-ssh-askpass.1x

EXTRA_DIST = SshAskpass-1337.ad SshAskpass-NeXTish.ad \
	SshAskpass-default.ad SshAskpass-green.ad SshAskpass-motif.ad

SshAskpass_ad.h: $(srcdir)/$(APP_DEFAULTS_FILE)
	sed -n '/^[^!]/s/.*/"&",/p' <$< >$@

x11-ssh-askpass.1x: x11-ssh-askpass.man
	cp $< $@

SshAskpass: $(srcdir)/$(APP_DEFAULTS_FILE)
	cp $< $@
