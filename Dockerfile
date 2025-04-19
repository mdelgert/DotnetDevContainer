FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy the solution and project files
COPY ["DotnetDevContainer.sln", "./"]
COPY ["ConsoleApp/ConsoleApp.csproj", "ConsoleApp/"]

# Restore dependencies
RUN dotnet restore

# Copy the rest of the source code
COPY . .

# Build the application
RUN dotnet build "DotnetDevContainer.sln" -c Release -o /app/build

# Publish the application
FROM build AS publish
RUN dotnet publish "ConsoleApp/ConsoleApp.csproj" -c Release -o /app/publish /p:UseAppHost=false

# Build the runtime image
FROM mcr.microsoft.com/dotnet/runtime:8.0 AS runtime
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ConsoleApp.dll"]