
DIR:=$(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
RHOST=

SHELL := /bin/bash

.PHONY: create help start stop list clean

help:
	@echo "" ; 
	@echo ""                ;
	@echo "--------------"  ;
	@echo " SwarmLab.io "   ;
	@echo "--------------"  ;
	@echo ""                ;
	@echo " USAGE: make [COMMAND]" ;
	@echo ""  ;
	@echo " Examples of [COMMAND] can be:"  ;
	@echo ""  ;
	@echo "      project-create: create service "  ;
	@echo ""  ;
	@echo "      latex-help: create latex docs "  ;
	@echo ""  ;
	@echo "      latex-clean: clean latex docs "  ;
	@echo ""  ;
	@echo "      latex-bib: create  latex bib "  ;
	@echo ""  ;
	@echo "      latex-edit: edit main.tex "  ;
	@echo ""  ;
	@echo "      project-start: start service "  ;
	@echo ""  ;
	@echo "      project-stop: shutdown service"  ;
	@echo ""  ;
	@echo "      project-clean: remove images in the system"  ;
	@echo ""  ;
	@echo "      project-list: show running containers of instance"  ;
	@echo ""  ;
	@echo "      help: show this message"  ;
	@echo ""  ;
	@echo "More info:"  ;
	@echo "http://docs.swarmlab.io/SwarmLab-HowTos/swarmlab/docs/swarmlab/docs/index.html"  ;
	@echo ""  ;
	@echo ""  ;

project-create:
	@ cd xelatex; ./install/usr/share/swarmlab.io/sec/swarmlab-sec create 2>/dev/null ; true

latex-help-:
	@cd docs; ./build.sh 2>/dev/null ; true

latex-edit:
	@cd xelatex;  ./bin/swl-nvim /home/docs/main.tex 2>/dev/null ; true

latex-build:
	@cd xelatex;  ./bin/make-clean-ant-compile.sh 2>/dev/null ; true

latex-bib:
	@cd xelatex;  ./bin/make-bib.sh 2>/dev/null ; true

latex-clean:
	@cd xelatex;  ./bin/latex-clean.sh 2>/dev/null ; true

project-start:
	@cd xelatex; ./install/usr/share/swarmlab.io/sec/swarmlab-sec up 2>/dev/null ; true

project-list:
	@cd xelatex; ./install/usr/share/swarmlab.io/sec/swarmlab-sec list 2>/dev/null ; true

project-stop:
	@cd xelatex; ./install/usr/share/swarmlab.io/sec/swarmlab-sec down 2>/dev/null ; true

project-clean:
	@cd xelatex; ./install/usr/share/swarmlab.io/sec/swarmlab-sec clean 2>/dev/null ; true
