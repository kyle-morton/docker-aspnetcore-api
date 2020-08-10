FROM mcr.microsoft.com/dotnet/core/sdk:3.1
 
WORKDIR /home/app

COPY ./*.sln ./
COPY ./*/*.csproj ./
RUN for file in $(ls *.csproj); do mkdir -p ./${file%.*}/ && mv $file ./${file%.*}/; done

RUN dotnet restore

COPY . .
 
RUN dotnet publish ./docker-web.app/docker-web.app.csproj -o /publish/
 
WORKDIR /publish
 
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
 
ENTRYPOINT ["dotnet", "docker-web.app.dll"]