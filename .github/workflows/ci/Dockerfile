FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as aspnetBuild

WORKDIR /appSource
COPY . /appSource

RUN dotnet restore
RUN dotnet publish -c Release -o /appPublish

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=aspnetBuild /appPublish /app

ENTRYPOINT ["dotnet", "AspnetWebApiStarter.dll"]