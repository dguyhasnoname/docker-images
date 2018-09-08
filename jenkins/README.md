##Docker image for jenkins


Command to build the image

```
docker build -t biharimukund/jenkins .
```

Command to run the container:

```
docker run -d -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --name jenkins biharimukund/jenkins
```

Jenkins UI can be accessed at http:/localhost:8080

