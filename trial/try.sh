#!/bin/sh

cd $(dirname $0)

docker kill simp-server
docker rm simp-server
docker run -p 80:80 -v $(pwd)/data:/usr/app/data:ro --name simp-server --entrypoint=node viswanathct/simp-server index.js
