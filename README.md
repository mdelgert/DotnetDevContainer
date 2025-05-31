# .NET Console App with Dev Containers

This repository contains a .NET console application configured to run in a development container.

## Prerequisites

- [Visual Studio Code](https://code.visualstudio.com/)
- [Docker](https://www.docker.com/products/docker-desktop)
- [Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) for VS Code

## Getting Started

1. Clone this repository
2. Open the folder in VS Code
3. When prompted, click **Reopen in Container** or run the "Remote-Containers: Reopen in Container" command from the Command Palette (F1)
4. Wait for the container to build and initialize

## Running the Application

Once the container is running:

1. Open a new terminal in VS Code
2. Run the application:
   ```sh
   dotnet run --project ConsoleApp
   ```

## Project Structure

- `.devcontainer/` — Dev container configuration
- `ConsoleApp/` — .NET console application project
- `DotnetDevContainer.sln` — Solution file
- `.github/workflows/` — GitHub Actions workflows

## Features

- Full .NET SDK environment
- Pre-installed VS Code extensions for .NET
- Debug and run .NET applications
- GitHub Actions workflow for CI/CD and container publishing

## Development Tips

- Use the **Run** menu or F5 to debug
- The terminal inside VS Code connects directly to the container
- All dependencies are installed in the container, keeping your local system clean

## Docker Container Deployment

### Build and Run Locally

Build the Docker image:
```sh
docker build -t dotnetdevcontainer .
```

Run the container:
```sh
docker run --rm dotnetdevcontainer
```

### GitHub Container Registry Deployment

#### Automatic Deployment via GitHub Actions

A GitHub Actions workflow automatically builds and pushes the Docker image to GitHub Container Registry when:
- You push to the `main` branch
- You create a release tag (format: `v1.0.0`)

Workflow file: `.github/workflows/docker-publish.yml`

To access published images:
1. Go to your GitHub repository
2. Click the **Packages** tab
3. Select the container image

#### Manual Deployment to GitHub Container Registry

1. Login to GitHub Container Registry:
   ```sh
   export CR_PAT=YOUR_PERSONAL_ACCESS_TOKEN
   echo $CR_PAT | docker login ghcr.io -u mdelgert --password-stdin
   ```
2. Build and tag your image:
   ```sh
   docker build -t ghcr.io/mdelgert/dotnetdevcontainer:latest .
   ```
3. Push the image:
   ```sh
   docker push ghcr.io/mdelgert/dotnetdevcontainer:latest
   ```

### Using the Container from GitHub Container Registry

After publishing, pull and run the image:
```sh
docker pull ghcr.io/mdelgert/dotnetdevcontainer:latest
docker run --rm ghcr.io/mdelgert/dotnetdevcontainer:latest
```

### Enter the Container and Run the Program Manually

```sh
docker run -it --rm --entrypoint /bin/bash ghcr.io/mdelgert/dotnetdevcontainer
# Inside the container:
dotnet ConsoleApp.dll
```

## Links

- [.NET Docker Images](https://github.com/dotnet/dotnet-docker)
- [Dev Container Images: .NET](https://github.com/devcontainers/images/tree/main/src/dotnet)
- [Dev Container Feature: Docker-in-Docker](https://github.com/devcontainers/features/tree/main/src/docker-in-docker)
- [Official .NET Docker Images Documentation](https://learn.microsoft.com/en-us/dotnet/architecture/microservices/net-core-net-framework-containers/official-net-docker-images)
- [Sample .NET App Dockerfile](https://github.com/dotnet/dotnet-docker/blob/main/samples/dotnetapp/Dockerfile)
- [Streamline Container Build with .NET 8](https://devblogs.microsoft.com/dotnet/streamline-container-build-dotnet-8/)