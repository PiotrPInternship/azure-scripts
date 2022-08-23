#!/bin/bash
echo "Assigning NSG to VNet subnets"
nsgname="NSG1"
resourcegroup="script-test"
vnetname="vnet1"
subnetsarray=(Subnet1 Subnet2)
amountofsubnets=2
for ((i=0; $((i<$amountofsubnets)); i++))
do
    az network vnet subnet update --resource-group $resourcegroup --name ${subnetsarray[$i]} --vnet-name $vnetname --network-security-group $nsgname
done  

