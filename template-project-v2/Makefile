## A sample Makefile to build a ROSE tool.
##
## Important: remember that Makefile recipes must contain tabs:
##
##     <target>: [ <dependency > ]*
##         [ <TAB> <command> <endl> ]+
## So you have to replace spaces with Tabs if you copy&paste this file from a browser!

## ROSE installation contains
##   * libraries, e.g. "librose.la"
##   * headers, e.g. "rose.h"
ROSE_INSTALL=/home/liao6/opt/latesRose/install


## Your Plugin source files
Plugin=PrintNamesPlugin
Plugin_SOURCE=$(Plugin).cpp

## Input testcode for your plugin
TESTCODE=test1.cpp

# Standard C++ compiler stuff (see rose-config --help)
comma   := ,
CXX      = $(shell $(ROSE_INSTALL)/bin/rose-config cxx)
CPPFLAGS = $(shell $(ROSE_INSTALL)/bin/rose-config cppflags) -I.
CXXFLAGS = $(shell $(ROSE_INSTALL)/bin/rose-config cxxflags)
LIBDIRS  = $(shell $(ROSE_INSTALL)/bin/rose-config libdirs)
LDFLAGS  = $(shell $(ROSE_INSTALL)/bin/rose-config ldflags) -L. \
           $(addprefix -Wl$(comma)-rpath -Wl$(comma), $(subst :, , $(LIBDIRS))) 

#-------------------------------------------------------------
# Makefile Targets
#-------------------------------------------------------------

all: $(Plugin).so

# compile the plugin and generate a shared library
# -g is recommended to be used by default to enable debugging your code
$(Plugin).so: $(Plugin_SOURCE)
	$(CXX) -g $(Plugin_SOURCE) -fpic -shared $(CPPFLAGS) $(LDFLAGS) -o $@

# test the plugin
check: $(Plugin).so
	$(ROSE_INSTALL)/bin/identityTranslator -c -rose:plugin_lib $(Plugin).so -rose:plugin_action print-names -rose:plugin_arg_print-names op1 -I. -I$(ROSE_INSTALL)/include $(TESTCODE) 

clean:
	rm -rf $(Plugin).so *.o rose_* *.dot

