source setenv.sh

cd $HOME

# build base
docker build \
  --build-arg ID=$ID \
  --build-arg CURRENT=$CURRENT \
  -t paraverse-base-$BASE_IMAGE:${BASE_VERSION} \
  -f $CURRENT/Dockerfile.$BASE_IMAGE .

# build personal
docker build \
  --build-arg ID=$ID \
  --build-arg CURRENT=$CURRENT \
  --build-arg BASE_IMAGE=$BASE_IMAGE \
  --build-arg BASE_VERSION=$BASE_VERSION \
  -t paraverse-personal-$BASE_IMAGE:${BASE_VERSION} \
  -f $CURRENT/Dockerfile .

cd -
