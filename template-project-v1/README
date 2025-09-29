Simplest Makefile to build a project using an installed copy of ROSE
* it uses $(ROSE_HOME)/bin/rose-config to automatically get all options.

First, edit set.rose to point to your path of an installed copy of ROSE

```
# set.rose
# if you want to builtin tools installed as part of ROSE installation
ROSE_HOME=/home/liao6/workspace/masterDevClean/install
export ROSE_HOME 

PATH=$ROSE_HOME/bin:$PATH
export PATH

# if you are using rpath, no need for this 
LD_LIBRARY_PATH=$ROSE_INS/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
```


After that, type:
```
# run set.rose to setup environment variables
source set.rose

# build the translator

make 

# run the translator to process input file: hello.cp
make check

# at this point, the output file rose_hello.cpp should be generated

ls
hello.cpp  hello.o  Makefile  myTranslator  myTranslator.cpp  README  rose_hello.cpp  set.rose

# clean up everything
make clean
```





