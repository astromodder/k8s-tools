# k8s-tools

This Dockerfile creates a Linux container image based on RockyLinux 9 with various utilities installed, which are useful for troubleshooting and managing Kubernetes resources.

## Installed Packages

The following packages are included in the image:

- bash-completion
- bind-utils
- curl
- git
- iputils
- jq
- mysql
- net-tools
- openldap-clients
- postgresql
- redis
- sqlite
- tcpdump
- unzip
- vim
- wget
- wireshark-cli

## Building the Docker Image

To build the Docker image for both ARM and AMD64 architectures, you can use Docker Buildx. Follow the instructions below.

1. Ensure you have Docker 20.10 or newer installed, as Buildx is included by default in these versions.
2. Check if Buildx is available by running `docker buildx version`.
3. Create a new builder instance with multi-architecture support:

   ```
   docker buildx create --name multiarch-builder --driver docker-container --use
   ```

4. Build and push the multi-architecture image:

   ```
   docker buildx build --platform linux/amd64,linux/arm64 -t <your-repo>/k8s-tools:latest --push .
   ```

   Replace `<your-repo>` with your desired repository name (e.g., `username` or `organization`).

5. Once the build is complete, you can check the newly pushed multi-architecture manifest:

   ```
   docker buildx imagetools inspect <your-repo>/k8s-tools:latest
   ```

That's it! You've successfully built and pushed a Docker image supporting both ARM and AMD64 architectures using Buildx.
