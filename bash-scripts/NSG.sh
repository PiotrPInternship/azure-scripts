#!/bin/bash
echo "Creating NSG and rule"
nsgname="NSG1"
resourcegroup="script-test"
location1="westeurope"

rulename="my1st-rule"
rulepriority=1000
arrayofrules(Allow Outbound SSH)

az network nsg create --name $nsgname --resource-group $resourcegroup --location $location1
az network nsg rule create --nsg-name $nsgname --resource-group $resourcegroup --name $rulename --priority $rulepriority --acces ${arrayofrules[0]} --direction ${arrayofrules[1]} --protocool ${arrayofrules[2]}
