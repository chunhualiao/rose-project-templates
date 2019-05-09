rose-project-templates
======================

rose-project-templates

A few templates for independent projects using ROSE.
By independent, we mean the projects are located outside of ROSE's source tree.

* template-project-v1 : using Makefile to build the project 
* template-project-v2 : using Makefile to build and run a ROSE plugin

Usually steps under each project directory:
* edit set.rose to have the right ROSE installation path
* source set.rose
* make
* make check
