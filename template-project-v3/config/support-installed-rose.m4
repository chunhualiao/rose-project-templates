# m4 macro to find installed copy of ROSE
# the conditional variable set for automake is USE_INSTALLED_ROSE =  0 or 1
# The path of installed ROSE is store in ROSE_INSTALL_PREFIX 
# Liao 11/21/2014
#
AC_DEFUN([SUPPORT_INSTALLED_ROSE],
[
AC_MSG_CHECKING(for installed ROSE)

AC_ARG_WITH([rose],
        AS_HELP_STRING([--with-rose=PATH],
                [use an installed copy of ROSE.  PATH is the installation prefix directory containing ROSE headers and libraries]),
        [rosesetting=$withval],
        [rosesetting=try])

USE_INSTALLED_ROSE=0

if test "x$rosesetting" != xno; then
# if =try or yes, auto detect the path 
   if test "x$rosesetting" = xtry -o "x$rosesetting" = xyes ; then
     if which identityTranslator > /dev/null 2> /dev/null; then
        ROSE_INSTALL_PREFIX="`which identityTranslator`"
        ROSE_INSTALL_PREFIX="`dirname $ROSE_INSTALL_PREFIX`"
        ROSE_INSTALL_PREFIX="`dirname $ROSE_INSTALL_PREFIX`"
# somehow the following sed does not work in configure!!
#        ROSE_INSTALL_PREFIX="`echo "$ROSE_INSTALL_PREFIX"|sed -e "s/\/[^\/]*$//"`"
#        ROSE_INSTALL_PREFIX="`echo "$ROSE_INSTALL_PREFIX"|sed -e "s/\/[^\/]*$//"`"
        USE_INSTALLED_ROSE=1
     elif test "x$rosesetting" = xyes ; then
         AC_MSG_ERROR([--with-rose is set but identityTranslator command not found in PATH]) 
     fi
  else  # now a path should be specified by the users
     if test -d "$rosesetting"; then
       ROSE_INSTALL_PREFIX="$rosesetting"
       USE_INSTALLED_ROSE=1
     else
       AC_MSG_ERROR([Argument to --with-rose must be path to bin directory, but argument is not a directory])
     fi
  fi 
else
   AC_MSG_ERROR([Must specify the path to an installed copy of rose using --with-rose=/path/to/rose_install])
fi

echo "ROSE installation path Found is $ROSE_INSTALL_PREFIX"

# sanity check for the prefix
if test $USE_INSTALLED_ROSE = 1; then
        if test ! -f "$ROSE_INSTALL_PREFIX/include/rose/rose.h" ; then
                AC_MSG_ERROR([rose.h could not be found in include/rose directory of $ROSE_INSTALL_PREFIX])
        fi
        AC_MSG_RESULT([$ROSE_INSTALL_PREFIX])
else
        AC_MSG_RESULT([no])
fi

AC_SUBST(ROSE_INSTALL_PREFIX)
AM_CONDITIONAL(USE_INSTALLED_ROSE, test "$USE_INSTALLED_ROSE" = 1)

])
