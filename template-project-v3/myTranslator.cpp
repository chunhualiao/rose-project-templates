// ROSE translator example: identity translator.
//
// No AST manipulations, just a simple translation:
//
//    input_code > ROSE AST > output_code

#include <rose.h>

int main (int argc, char** argv)
{
    // Build the AST used by ROSE
    SgProject* project = frontend(argc, argv);

    // Run internal consistency tests on AST
    AstTests::runAllTests(project);

    // Insert your own manipulations of the AST here...

    // Generate source code from AST and invoke your
    // desired backend compiler
    return backend(project);
}

