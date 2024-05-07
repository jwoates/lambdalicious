# install lambda emulator
```
mkdir -p ~/.aws-lambda-rie && \
    curl -Lo ~/.aws-lambda-rie/aws-lambda-rie https://github.com/aws/aws-lambda-runtime-interface-emulator/releases/latest/download/aws-lambda-rie && \
    chmod +x ~/.aws-lambda-rie/aws-lambda-rie
```

# build image
```
docker build -t docker-image:test .
```

# start lambda
```
docker run --rm -d -v ~/.aws-lambda-rie:/aws-lambda -p 9000:8080 \
  --entrypoint /aws-lambda/aws-lambda-rie \
  docker-image:test /usr/local/bin/aws_lambda_ric app.App::Handler.process
```    

# test
```
curl "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
```
