#!/bin/bash


SERVICE_URL=https://git.swarmlab.io:3000/swarmlab/microservice-xelatexthesis.git
SERVICE_NAME=microservice-xelatexthesis
SERVICE_NAME_MENOU=xelatexthesis


SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  TARGET="$(readlink "$SOURCE")"
  if [[ $TARGET == /* ]]; then
    SOURCE="$TARGET"
  else
    DIR="$( dirname "$SOURCE" )"
    SOURCE="$DIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  fi
done

SRPATH="$( dirname "$SOURCE" )"
SFPATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
if [ "$SFPATH" != "$SRPATH" ]; then
  RDIR=$SRPATH    # relativ path directory
fi

cwdir=$PWD
wdir=$SFPATH

echo $cwdir

echo $wdir

cat << EOF > $wdir/antora.yml

    name: swarmlab_${SERVICE_NAME}
    title: swarmlab_${SERVICE_NAME}
    version: docs
    nav:
    - modules/ROOT/nav.adoc
EOF


cat << EOF > $wdir/site.yml
site:
  title: Swarmlab ${SERVICE_NAME}
  url: http://docs.swarmlab.io/SwarmLab-HowTos/swarmlab/docs
  start_page: swarmlab_${SERVICE_NAME}::index.adoc
content:
  sources:
  - url: ${SERVICE_URL}
    branches: master
    start_path: docs
ui:
  bundle:
    url: https://git.swarmlab.io:3000/docs/docs/raw/branch/master/ui-bundle.zip
    snapshot: true
  supplemental_files: ./supplemental-ui
asciidoc:
  attributes:
    :plantuml-server-url: http://www.plantuml.com/plantuml
  extensions:
  - '@djencks/asciidoctor-mathjax'
  - asciidoctor-plantuml
EOF

cat << EOF > $wdir/modules/ROOT/nav.adoc
* xref:index.adoc[${SERVICE_NAME_MENOU}]
EOF











