source setenv.sh

# remove all existing containers
docker container rm -f `docker container ls -a -q --filter "ancestor=paraverse-personal-${BASE_IMAGE}:1.0"` 2>/dev/null

# start
CID=`docker run -d -it \
-h test \
-v /Users/${ID}/500-work:/Users/${ID}/500-work \
-v /Users/${ID}/.gradle:/Users/${ID}/.gradle \
paraverse-personal-${BASE_IMAGE}:1.0`
echo "Start container ${CID} for user ${ID}"

# login
docker exec -it $CID bash
