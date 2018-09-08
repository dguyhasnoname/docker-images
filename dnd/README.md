# docker-in-docker

This repo can be used to create a docker image which contains docker command baked inside it.

Command to run the container:

```
docker run -d -v /var/run/docker.sock:/var/run/docker.sock --name dnd biharimukund/dnd
```
