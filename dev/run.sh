function run() {
    VERSION=$1
    
    docker run \
        -p 45000:80 \
        $DOCKER_REGISTRY/aspnet-webapi-starter:$VERSION
}

run "v0.1.0-local"