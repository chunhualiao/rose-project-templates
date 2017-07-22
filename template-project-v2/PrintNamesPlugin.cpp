#include "rose.h"
#include "plugin.h"
#include "RoseAst.h"

#include <iostream>

using namespace std;
using namespace Rose;

class PrintNamesAction : public Rose::PluginAction {
 public:
    PrintNamesAction() {}
    ~PrintNamesAction() {}

  // Provide command line option processing: arg will be the options passed to this plugin
   bool ParseArgs(const std::vector<std::string> &arg) 
   {
     cout<<arg.size()<< " arguments "<<endl;
     for (size_t i=0; i< arg.size(); i++)
     {
       cout<<arg[i]<<endl;
     }
     return true; 
   };

    // Do actual work after ParseArgs();
    void process (SgNode* n) {
      SgNode* node= n;
      RoseAst ast(node);

      for(RoseAst::iterator i=ast.begin();i!=ast.end();++i) {
        SgFunctionDeclaration* fdecl= isSgFunctionDeclaration(*i);
        if (fdecl && (fdecl->get_definingDeclaration()==fdecl))
          cout<<fdecl->get_name()<<endl;
      }

    } // end process()
};

//Declare a plug entry and register it
static Rose::PluginRegistry::Add<PrintNamesAction>  X("print-names", "print node names in pre-order");

