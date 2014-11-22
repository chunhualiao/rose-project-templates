# where to find rose and boost libraries 
include $(top_srcdir)/config/Makefile.for.ROSE.includes.and.libs

# search path for .m4 macros
ACLOCAL_AMFLAGS = -I ./config

INCLUDES =  -I$(ROSE_INSTALL)/include/rose -I$(BOOST_INSTALL)/include

bin_PROGRAMS = myTranslator
myTranslator_SOURCES = myTranslator.cpp 

myTranslator_LDADD = -L$(ROSE_INSTALL)/lib -lrose -lboost_iostreams

## Input testcode for your translator
TESTCODE=hello.cpp

# test the translator
check: myTranslator
	source ./set.rose ; ./myTranslator -c -I. $(TESTCODE) 

clean:
	rm -rf myTranslator *.o rose_* *.dot
