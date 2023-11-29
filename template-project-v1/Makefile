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
#If the ROSE bin directory is in your path, rose-config can be found automatically
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

MOSTLYCLEANFILES =

## Your translator
TRANSLATOR=myTranslator
TRANSLATOR_SOURCE=$(TRANSLATOR).cpp

## Input testcode for your translator
INPUT_FILES=hello.cpp

OUTPUT_FILES = $(addprefix rose_,${INPUT_FILES})

#-------------------------------------------------------------
# Makefile Targets
#-------------------------------------------------------------

all: $(TRANSLATOR)

# compile the translator and generate an executable
# -g is recommended to be used by default to enable debugging your code
$(TRANSLATOR): $(TRANSLATOR_SOURCE)
	$(ROSE_CXX) $(ROSE_CPPFLAGS) $(ROSE_CXXFLAGS) -o $@ $^ $(ROSE_LDFLAGS) $(ROSE_LINK_RPATHS) -Wl,-rpath=$(ROSE_HOME)/lib

# USING static pattern to define the rule to build output files
# the order of two requisites matters!!
$(OUTPUT_FILES): rose_%:% $(TRANSLATOR)        
	./$(TRANSLATOR) -c -I. -I$(ROSE_HOME)/include $*

# test the translator
check: $(OUTPUT_FILES)

clean:
	rm -rf $(TRANSLATOR) *.o rose_* *.dot

