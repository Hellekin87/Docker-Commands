# Docker-Commands

show all containers!

docker ps -a

stop all containers:

docker kill $(docker ps -q)

remove all containers

docker rm $(docker ps -a -q)

remove all docker images

docker rmi $(docker images -q)

commit changes made on a container to create a new image

docker commit CONTAINER_ID NEW_IMAGE_NAME

Image benennen (fürs Hochladen im Hub)

docker tag [OPTIONS] IMAGE[:TAG] [REGISTRYHOST/][USERNAME/]NAME[:TAG]

Then docker push using that same tag.

docker push NAME[:TAG]

Shell des Containers öffnen

docker exec -it -u root CONTAINER bash

container in image speichern

docker commit CONTAINER IMAGENAME
