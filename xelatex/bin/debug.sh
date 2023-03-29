#!/bin/bash

xelatex=xelatex-masterservice-1
      docker exec $xelatex /bin/sh -c "cp -f   metaptyxiako.bib  metaptyxiako_bib.backup1"
      docker exec $xelatex /bin/sh -c "latex-pdf -f main" 

