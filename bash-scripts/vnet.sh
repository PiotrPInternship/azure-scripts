#!/bin/bash
echo "Creating VNET"

vnetname="vnet1"
resourcegroup="script-test"
location1="westeurope"
addressspace="10.1.0.0/16"
subnetsArray=("Subnet1" "10.1.0.0/24" "Subnet2" "10.1.1.0/24")
subnets=2

# subnet1="Subnet1"
# subnet1adress="10.1.0.0/24"
# az network vnet create --name $vnetname --resource-group $resourcegroup --location $location1 --address-prefix $addressspace --subnet-name $subnet1 --subnet-prefix $subnet1adress

az network vnet create --name $vnetname --resource-group $resourcegroup --location $location1 --address-prefix $addressspace --subnet-name ${subnetsArray[0]} --subnet-prefix ${subnetsArray[1]}

for ((i = 2; i < $((($subnets*2)-1)); i += 2)); 
    do
        az network vnet subnet create --resource-group $resourcegroup --vnet-name $vnetname --name ${subnetsArray[$i]} --address-prefixes ${subnetsArray[$((i + 1))]}
    done
