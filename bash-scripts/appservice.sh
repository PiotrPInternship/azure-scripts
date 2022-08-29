
#!/bin/bash
#app service Linux based creating

resourcegroup ='storage-resource-group'
location1='westeurope'
serviceplan='linux-app-service-plan'
workers=3
pricingtier='B1'
az appservice plan create -n $serviceplan -g 'storage-resource-group' --location $location1 --is-linux --number-of-workers $workers --sku $pricingtier 

appname='LinuxDockerApp-ppaszek'

az webapp create --resource-group 'storage-resource-group' --plan $serviceplan --name $appname --deployment-container-image-name mcr.microsoft.com/dotnet/samples:aspnetapp

-g $resourcegroup