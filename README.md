# install lambda emulator

not neeeded, but can be used with a non lambda base image

```
mkdir -p ~/.aws-lambda-rie && \
    curl -Lo ~/.aws-lambda-rie/aws-lambda-rie https://github.com/aws/aws-lambda-runtime-interface-emulator/releases/latest/download/aws-lambda-rie && \
    chmod +x ~/.aws-lambda-rie/aws-lambda-rie
```

# build image
```
docker build -t lambdalicious:latest .
```

# start lambda
```
docker run --rm -d -p 9000:8080 lambdalicious:latest
```

# exec
```
docker exec -it labdalicious /bin/sh
```

# test
```
curl -v "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"payload":"hello world!"}'
```
