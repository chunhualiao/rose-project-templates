# two comment sytles: dnl and #
dnl Process this file with autoconf to produce a configure script.
# required autoconf version
AC_PREREQ(2.59)

# mandatory initialization with program name, version , and author
AC_INIT([myTranslator], [0.1], [me@somewhere.us])

# store depcomp install-sh missing etc into config, instead of top directory
AC_CONFIG_AUX_DIR([config])
#Specify dir as the location of additional local Autoconf macros. 
AC_CONFIG_MACRO_DIR([config])

# automake's version
AM_INIT_AUTOMAKE([1.9.5])

#what programs are needed
AC_PROG_CC
AC_PROG_CXXCPP
#AM_PROG_LEX
#AC_PROG_YACC
#AC_PROG_LIBTOOL


SUPPORT_INSTALLED_ROSE
ROSE_SUPPORT_BOOST

# let generated configure script output Makefile from Makefile.in, which is produced
# from Makefile.am by Automake
AC_CONFIG_FILES([
  Makefile
])

AC_OUTPUT
