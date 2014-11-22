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
ROSE_INSTALL=/home/liao6/workspace/rose-2014-10-13/install

## ROSE uses the BOOST C++ libraries
BOOST_INSTALL=/home/liao6/opt/boost_1.47.0

## Your translator
TRANSLATOR=myTranslator
TRANSLATOR_SOURCE=$(TRANSLATOR).cpp

## Input testcode for your translator
TESTCODE=hello.cpp

#-------------------------------------------------------------
# Makefile Targets
#-------------------------------------------------------------

all: $(TRANSLATOR)

# compile the translator and generate an executable
# -g is recommended to be used by default to enable debugging your code
# Note: depending on the version of boost, you may have to use something like -I $(BOOST_ROOT)/include/boost-1_40 instead. 
$(TRANSLATOR): $(TRANSLATOR_SOURCE)
	g++ -g $(TRANSLATOR_SOURCE) -I$(BOOST_INSTALL)/include -I$(ROSE_INSTALL)/include/rose -L$(ROSE_INSTALL)/lib -lrose -lboost_iostreams -o $(TRANSLATOR)

# test the translator
check: $(TRANSLATOR)
	source ./set.rose ; ./$(TRANSLATOR) -c -I. -I$(ROSE_INSTALL)/include $(TESTCODE) 

clean:
	rm -rf $(TRANSLATOR) *.o rose_* *.dot

