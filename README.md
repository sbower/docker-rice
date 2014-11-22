docker-rice
===========

Basic rice instance. In order to run you must pass db creds to the process

### Usage

```
docker run -i -t \
	-e DB_URL=jdbc:mysql://someplace/rice \
	-e DB_USER=user \
	-e DB_PASS=pass \
	-e APP_URL=http://192.168.59.103:8080 \
	-p 8080:8080 cucommunityapps/rice-demo 
```

Then point your browser at [http://localhost:8080/kr-dev](http://localhost:8080/kr-dev)

or [http://192.168.59.103:8080/kr-dev](http://192.168.59.103:8080/kr-dev) if you are using boot2docker

## Building

To build the image, simply invoke

    cd docker-rice
    docker build -t "docker-rice" .

A prebuilt container is also available in the docker index

    docker pull cucommunityapps/rice-demo
    
## Author

  * Shawn Bower (<shawn.bower@gmail.com>)
