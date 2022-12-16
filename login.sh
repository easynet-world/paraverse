source setenv.sh

CID=`docker container ls -a -q --filter "ancestor=paraverse-personal-${BASE_IMAGE}:1.0" | head -1`

# login
docker exec -it $CID bash
