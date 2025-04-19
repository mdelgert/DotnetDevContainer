# .NET Console App with Dev Containers

This repository contains a .NET console application configured to run in a development container.

## Prerequisites

- [Visual Studio Code](https://code.visualstudio.com/)
- [Docker](https://www.docker.com/products/docker-desktop)
- [Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) for VS Code

## Getting Started

1. Clone this repository
2. Open the repository folder in VS Code
3. When prompted, click "Reopen in Container" or run the "Remote-Containers: Reopen in Container" command from the Command Palette (F1)
4. Wait for the container to build and initialize

## Running the Application

Once the container is running:

1. Open a new terminal in VS Code
2. Run the application with:
   ```
   dotnet run --project ConsoleApp
   ```

## Exploring the Project Structure

- `.devcontainer/` - Contains configuration for the development container
- `ConsoleApp/` - The .NET console application project
- `DotnetDevContainer.sln` - The solution file
- `.github/workflows/` - GitHub Actions workflow configurations

## Features

- Full .NET SDK environment ready for development
- Pre-installed VS Code extensions for .NET development
- Configured for debugging and running .NET applications
- GitHub Actions workflow for CI/CD and container publishing

## Development Tips

- Use the "Run" menu or F5 to debug the application
- The terminal inside VS Code connects directly to the container
- All dependencies are installed in the container, keeping your local system clean

## Docker Container Deployment

### Building and Running Locally

Build the Docker image:
```
docker build -t dotnet-dev-container .
```

Run the container:
```
docker run --rm dotnet-dev-container
```

### GitHub Container Registry Deployment

#### Automatic Deployment via GitHub Actions

This repository includes a GitHub Actions workflow that automatically builds and pushes the Docker image to GitHub Container Registry when:
- You push to the main branch
- You create a release tag (format: v1.0.0)

The workflow file is located at `.github/workflows/docker-publish.yml`.

To access the published images:
1. Go to your GitHub repository
2. Click on the "Packages" tab
3. Select the container image

#### Manual Deployment to GitHub Container Registry

1. Login to GitHub Container Registry:
   ```
   export CR_PAT=YOUR_PERSONAL_ACCESS_TOKEN
   echo $CR_PAT | docker login ghcr.io -u mdelgert --password-stdin
   ```

2. Build and tag your image:
   ```
   docker build -t ghcr.io/mdelgert/dotnet-dev-container:latest .
   ```

3. Push the image to GitHub Container Registry:
   ```
   docker push ghcr.io/mdelgert/dotnet-dev-container:latest
   ```

### Using the Container from GitHub Container Registry

After the image is published, you can pull and run it using:
```
docker pull ghcr.io/mdelgert/dotnet-dev-container:latest
docker run --rm ghcr.io/mdelgert/dotnet-dev-container:latest
```

Replace `mdelgert` with your actual GitHub username.