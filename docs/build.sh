docker stop swarmlab-documentation
docker container rm swarmlab-documentation
docker pull hub.swarmlab.io:5480/antora

docker run -ti --name swarmlab-documentation -p 8080:8080 -v $PWD/:/antora -v $PWD/supplemental-ui:/antora/supplemental-ui hub.swarmlab.io:5480/antora  /bin/sh -c "DOCSEARCH_ENABLED=true DOCSEARCH_ENGINE=lunr DOCSEARCH_INDEX_VERSION=latest NODE_PATH=/usr/local/lib/node_modules:\$NODE_PATH exec sh -c '/antora/run/build.sh'"
