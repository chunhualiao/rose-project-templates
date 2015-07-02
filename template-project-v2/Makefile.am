# where to find rose and boost libraries 
ROSE_INSTALL = /home/liao6/workspace/rose-2014-10-13/install
BOOST_INSTALL = /home/liao6/opt/boost_1.47.0

INCLUDES =  -I$(ROSE_INSTALL)/include/rose -I$(BOOST_INSTALL)/include

bin_PROGRAMS = myTranslator
myTranslator_SOURCES = myTranslator.cpp 

myTranslator_LDADD = -L$(ROSE_INSTALL)/lib -lrose -L$(BOOST_INSTALL)/lib -lboost_iostreams -lboost_system

## Input testcode for your translator
TESTCODE=hello.cpp

# test the translator
check: myTranslator
	source ./set.rose ; ./myTranslator -c -I. $(TESTCODE) 

clean:
	rm -rf myTranslator *.o rose_* *.dot
