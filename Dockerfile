FROM mcr.microsoft.com/dotnet/sdk:7.0 AS publish
WORKDIR /app
COPY . /app
RUN dotnet publish "build-sample.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/runtime:7.0
COPY --from=publish /app/publish /app
WORKDIR /app
ENTRYPOINT ["dotnet", "build-sample.dll"]
