# aspnet-webapi-starter

A starter template for development of ASP .NET Core Web API inside Docker containers with Visual Studio Code

## Try it on your Dev Machine

1. Install the prerequisites
    - [Docker for Desktop](https://www.docker.com/products/docker-desktop)
    - [Visual Studio Code](https://code.visualstudio.com/)
      - install extention [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
    - [git](https://git-scm.com/downloads)
2. Clone the repo
    ```
    git clone https://github.com/vtrifonov-esfiddle/aspnet-webapi-starter.git
    ```
3. Open the repo root directory in VS Code
4. Press F1 in VS Code
5. type `>Remote-Containers: Reopen in Container`
6. Press F5 in VS Code to start debugging
7. On your dev machine navigate to http://localhost:5000/

### Environment Variables

The following environment variables are available for `aspnet-webapi-starter` container

- WORKSPACE_DIR_DOCKER_MOUNT 
  - this is the repository workspace root directory docker mount
  - e.g `/host_mnt/c/GithubRepos/aspnet-webapi-starter`
  - necessary for bind mounts because you cannot start nested docker container from `aspnet-webapi-starter` on non-linux host machine
    - [see bind mounts propagation](https://docs.docker.com/storage/bind-mounts/#configure-bind-propagation) 
- DOCKER_REGISTRY 
  - your github docker registry
  - allows you to tag/push/pull images to your docker registry without hardcoding it
    - you need to [login to the registry](#-Push/Pull-from-your-aspnet-webapi-starter-Docker-Registry) to use it
  - e.g: `docker.pkg.github.com/vtrifonov-esfiddle/aspnet-webapi-starter`
    - this matches `docker.pkg.github.com/${{ github.repository }}` from the github workflow `CI`
- GITHUB_USERNAME
  - your github username

## Push/Pull from your aspnet-webapi-starter Docker Registry

To work locally with your docker registry you need read and write access. Performs the steps once you have generated your repo from the template

1. create `PAT` (personal access token) with the following permissions via https://github.com/settings/tokens
    - read:packages
    - repo, write:packages
2. on the dev container login to the registry using `PAT`
   - the username is provided via an environment variable available on the dev container
```
docker login docker.pkg.github.com -u $GITHUB_USERNAME
```