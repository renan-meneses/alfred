FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /app

COPY alfred.sln ./
COPY core/*.csproj ./core/
COPY teste/*.csproj ./teste/
RUN dotnet restore

# Copie todo o código fonte e construa o projeto
COPY . ./
RUN dotnet build -c Release -o out

# Execute os testes
# RUN dotnet test teste/teste.csproj -c Release

# Publicar o projeto
RUN dotnet publish core/core.csproj -c Release -o out

# Configura a imagem final
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "Core.dll"]