#!/bin/bash
echo "Creating NSG and rule"
nsgname="NSG1"
resourcegroup="script-test"
location1="westeurope"

rulename="my1st-rule"
arrayofrules=(Allow Outbound Tcp)
rulepriority=1000


az network nsg create --name $nsgname --resource-group $resourcegroup --location $location1
az network nsg rule create --nsg-name $nsgname --resource-group $resourcegroup --name $rulename --priority $rulepriority --acces ${arrayofrules[0]} --direction ${arrayofrules[1]} --protocol ${arrayofrules[2]}