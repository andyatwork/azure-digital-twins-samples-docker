FROM mcr.microsoft.com/dotnet/sdk:3.1
RUN mkdir -p /usr/src/app
COPY ./AdtSampleApp/* /usr/src/app/
WORKDIR /usr/src/app
RUN dotnet build
CMD dotnet run