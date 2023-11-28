## A sample Makefile to build a ROSE tool.
##
## Important: remember that Makefile recipes must contain tabs:
##
##     <target>: [ <dependency > ]*
##         [ <TAB> <command> <endl> ]+
## So you have to replace spaces with Tabs if you copy&paste this file from a browser!

## ROSE installation contains
##   * libraries, e.g. "librose.la"
ifndef ROSE_HOME
ROSE_HOME = $(shell rose-config prefix)
endif

include $(ROSE_HOME)/lib/rose-config.cfg

# Standard C++ compiler stuff (see rose-config --help)
ROSE_CXX         = $(shell $(ROSE_HOME)/bin/rose-config ROSE_CXX)
ROSE_CPPFLAGS    = $(shell $(ROSE_HOME)/bin/rose-config ROSE_CPPFLAGS)
ROSE_CXXFLAGS    = $(shell $(ROSE_HOME)/bin/rose-config ROSE_CXXFLAGS)
ROSE_LDFLAGS     = $(shell $(ROSE_HOME)/bin/rose-config ROSE_LDFLAGS)
ROSE_LIBDIRS     = $(shell $(ROSE_HOME)/bin/rose-config ROSE_LIBDIRS)
ROSE_RPATHS      = $(shell $(ROSE_HOME)/bin/rose-config ROSE_RPATHS)
ROSE_LINK_RPATHS = $(shell $(ROSE_HOME)/bin/rose-config ROSE_LINK_RPATHS)

MOSTLYCLEANFILES =##   * headers, e.g. "rose.h"

## Your Plugin source files
Plugin=PrintNamesPlugin
Plugin_SOURCE=$(Plugin).cpp

## Input testcode for your plugin
TESTCODE=test1.cpp

#-------------------------------------------------------------
# Makefile Targets
#-------------------------------------------------------------

all: $(Plugin).so

# compile the plugin and generate a shared library
# -g is recommended to be used by default to enable debugging your code
$(Plugin).so: $(Plugin_SOURCE)
	$(CXX) -g $(Plugin_SOURCE) -fpic -shared $(ROSE_CPPFLAGS) $(ROSE_LDFLAGS) -o $@

# test the plugin
check: $(Plugin).so
	$(ROSE_HOME)/bin/rose-c++ -c -rose:plugin_lib $(Plugin).so -rose:plugin_action print-names -rose:plugin_arg_print-names op1 -I. -I$(ROSE_HOME)/include $(TESTCODE) 

clean:
	rm -rf $(Plugin).so *.o rose_* *.dot

