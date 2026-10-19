#!/bin/sh
#
# autogen.sh: run this to (possibly) update autoconf-generated files.
#
# Author: Darren Tucker.  Placed in the public domain.

set -e
autoreconf -i -f
rm -rf autom4te.cache configure~
