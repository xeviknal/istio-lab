DOCKER_NAME=xeviknal/serviceentries-test
DOCKER_VERSION=dev
DOCKER_TAG=${DOCKER_NAME}:${DOCKER_VERSION}

docker build -t ${DOCKER_TAG} docker
