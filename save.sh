source setenv.sh

# get container ID
CID=`docker container ls -a -q --filter "ancestor=paraverse-personal-${BASE_IMAGE}:1.0" | head -1`

echo "Save ${CID}"

# save container as image and file
VERSION_ID=${ID}-`date "+%y%m%d.%H%M%S"`
docker commit ${CID} paraverse-personal-${BASE_IMAGE}:${VERSION_ID} 2>/dev/null
echo "Commit version ${VERSION_ID}"

docker save -o paraverse-personal-${BASE_IMAGE}-${VERSION_ID}.tar.gz paraverse-personal-${BASE_IMAGE}:${VERSION_ID}
