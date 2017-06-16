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
ROSE_INSTALL=/export/liao6/rose/install

## ROSE uses the BOOST C++ libraries
BOOST_INSTALL=/export/liao6/opt/boost_1_50_inst/

## Your translator
TRANSLATOR=myTranslator
TRANSLATOR_SOURCE=$(TRANSLATOR).cpp

## Input testcode for your translator
TESTCODE=hello.cpp

# The Sawyer lib used in ROSE uses a long list of boost libs
BOOST_LIBS=-lboost_date_time -lboost_thread -lboost_filesystem -lboost_program_options -lboost_regex -lboost_system -lboost_serialization -lboost_wave -lboost_iostreams 

# Using rpath to avoid using LD_LIBRARY_PATH in environment settings
LINK_FLAGS=-Wl,-rpath=$(ROSE_INSTALL)/lib -L$(ROSE_INSTALL)/lib -lrose -pthread -Wl,-rpath=$(BOOST_INSTALL)/lib -L$(BOOST_INSTALL)/lib $(BOOST_LIBS) -lm

#-------------------------------------------------------------
# Makefile Targets
#-------------------------------------------------------------

all: $(TRANSLATOR)

# compile the translator and generate an executable
# -g is recommended to be used by default to enable debugging your code
$(TRANSLATOR): $(TRANSLATOR_SOURCE)
	g++ -g $(TRANSLATOR_SOURCE) -I$(BOOST_INSTALL)/include -I$(ROSE_INSTALL)/include/rose $(LINK_FLAGS) -o $(TRANSLATOR)

# test the translator
check: $(TRANSLATOR)
	./$(TRANSLATOR) -c -I. -I$(ROSE_INSTALL)/include $(TESTCODE) 

clean:
	rm -rf $(TRANSLATOR) *.o rose_* *.dot

