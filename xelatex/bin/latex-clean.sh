
xelatex=xelatex-masterservice-1
docker exec  $(xelatex) /bin/bash -c "cp -f metaptyxiako.bib metaptyxiako_bib.backup1"
docker exec  $(xelatex) /bin/bash -c "/usr/local/bin/latex-clean -f main"
docker exec  $(xelatex) /bin/bash -c "ls -al metaptyxiako.bib"
docker exec  $(xelatex) /bin/bash -c "cp -f metaptyxiako.bib.backup1 metaptyxiako_bib"
docker exec  $(xelatex) /bin/bash -c "rm -f docs/main.lot"
docker exec  $(xelatex) /bin/bash -c "rm -f docs/main.toc"
