function build() {
    VERSION=$1
    ContextDir="/app/src"
    ImageId="$DOCKER_REGISTRY/aspnet-webapi-starter"
    DockerfilePath="/app/.github/workflows/ci/Dockerfile"
    docker build -f $DockerfilePath -t $ImageId:$VERSION $ContextDir
}

build "v0.1.0-local"
