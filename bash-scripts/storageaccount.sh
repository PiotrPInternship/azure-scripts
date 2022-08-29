#!/bin/bash
accountname='ppaszek'
resourcegroup='storage-resource-group'
location1='westeurope'
pricing_tier='Hot'
az storage account create --name $accountname --resource-group $resourcegroup --location $location1 --access-tier $pricing_tier