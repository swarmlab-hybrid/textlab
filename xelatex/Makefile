
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
	@echo "      create: create service "  ;
	@echo ""  ;
	@echo "      create-latex-docs: create latex docs "  ;
	@echo ""  ;
	@echo "      start: start service "  ;
	@echo ""  ;
	@echo "      stop: shutdown service"  ;
	@echo ""  ;
	@echo "      clean: remove images in the system"  ;
	@echo ""  ;
	@echo "      list: show running containers of instance"  ;
	@echo ""  ;
	@echo "      help: show this message"  ;
	@echo ""  ;
	@echo "More info:"  ;
	@echo "http://docs.swarmlab.io/SwarmLab-HowTos/swarmlab/docs/swarmlab/docs/index.html"  ;
	@echo ""  ;
	@echo ""  ;

create:
	@./install/usr/share/swarmlab.io/sec/swarmlab-sec create 2>/dev/null ; true

create-latex-docs:
	@cd docs; ./build.sh 2>/dev/null ; true

start:
	@./install/usr/share/swarmlab.io/sec/swarmlab-sec up 2>/dev/null ; true

list:
	@./install/usr/share/swarmlab.io/sec/swarmlab-sec list 2>/dev/null ; true

stop:
	@./install/usr/share/swarmlab.io/sec/swarmlab-sec down 2>/dev/null ; true

clean:
	@./install/usr/share/swarmlab.io/sec/swarmlab-sec clean 2>/dev/null ; true
