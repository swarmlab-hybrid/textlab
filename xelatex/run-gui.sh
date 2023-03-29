xhost +local:docker 
docker exec  -e DISPLAY=$DISPLAY  microservice-xelatexthesis_masterservice_1 /bin/sh -c "latex-all"
