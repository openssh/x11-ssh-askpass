libexec_PROGRAMS = x11-ssh-askpass
x11_ssh_askpass_SOURCES = drawing.c dynlist.c resources.c x11-ssh-askpass.c
nodist_x11_ssh_askpass_SOURCES = SshAskpass_ad.h
x11_ssh_askpass_CFLAGS = $(X11_CFLAGS) $(XT_CFLAGS) $(SM_CFLAGS) $(ICE_CFLAGS)
x11_ssh_askpass_LDADD = $(X11_LIBS) $(XT_LIBS) $(SM_LIBS) $(ICE_LIBS)
askpassconfdir = $(sysconfdir)/X11/app-defaults
askpassconf_DATA = SshAskpass
CLEANFILES = SshAskpass_ad.h x11-ssh-askpass.1x SshAskpass
man1_MANS = x11-ssh-askpass.1x
BUILT_SOURCES = SshAskpass_ad.h x11-ssh-askpass.1x
SshAskpass_ad.h:SshAskpass-default.ad
	sed -n '/^[^!]/s/.*/"&",/p' <$< >$@
x11-ssh-askpass.1x:x11-ssh-askpass.man
	cp $< $@
SshAskpass:SshAskpass-default.ad
	cp $< $@
