#!/bin/sh

set -ex

# Data
imageName=viswanathct/simp-server
version=$(cat VERSION)

# Update
git pull

# Build
sh ./build.sh

# Tag
git tag -d "$version" | true
git tag -a "$version" -m "version: $version"
docker tag $imageName:latest $imageName:$version

# Push
git push
git push --tags
docker push $imageName:latest
docker push $imageName:$version
