#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get update
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
apt-get install -y apt-transport-https
apt-get update

ln -fs /usr/share/zoneinfo/UTC /etc/localtime
apt-get install -y tzdata
dpkg-reconfigure --frontend noninteractive tzdata

apt-get install -y dotnet-sdk-3.1 git
git clone https://github.com/andyatwork/azure-digital-twins-samples-docker.git
cd azure-digital-twins-samples-docker/AdtSampleApp/SampleClientApp
dotnet build
while true ; do echo "alive" ; sleep 60; done