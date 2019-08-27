# sample

`openssh-client` `nginx` stream proxy staging environment.

## pre-requisites

1. [docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/ "docker")
2. [docker-compose](https://docs.docker.com/compose/install/ "docker-compose")

## usage

Build the `sftp` server image with buildkit enabled: `DOCKER_BUILDKIT=1 docker build -f sftp/Dockerfile -t sftp sftp`

Create the staging environment: `docker-compose up --no-start`

Add an authorized key to access the `sftp` server i.e.: `docker cp ${HOME}/.ssh/id_rsa.pub sftp:/home/ubuntu/.ssh/authorized_keys`

Build the `openssh-client` images:
- `docker build --rm -f openssh-client/12.04/Dockerfile -t openssh-client:5.9p1 openssh-client/12.04/`
- `docker build --rm -f openssh-client/18.04/Dockerfile -t openssh-client:7.6p1 openssh-client/18.04/`
- `docker build --rm -f openssh-client/stretch/Dockerfile -t openssh-client:7.4p1 openssh-client/stretch/`
- `docker build --rm -f openssh-client/buster/Dockerfile -t openssh-client:7.9p1 openssh-client/buster/`

`sftp` to the server using the client i.e.: `docker run --rm -it -v ${HOME}/.ssh:/home/ubuntu/.ssh --entrypoint sftp --network stage openssh-client:${TAG} ubuntu@sftp:/input`
