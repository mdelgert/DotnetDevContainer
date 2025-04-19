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

## Features

- Full .NET SDK environment ready for development
- Pre-installed VS Code extensions for .NET development
- Configured for debugging and running .NET applications

## Development Tips

- Use the "Run" menu or F5 to debug the application
- The terminal inside VS Code connects directly to the container
- All dependencies are installed in the container, keeping your local system clean