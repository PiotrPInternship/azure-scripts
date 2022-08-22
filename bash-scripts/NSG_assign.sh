#!/bin/bash
echo "Assigning NSG to VNet subnet"
$nsgname="NSG1"
$resourcegroup="script-test"
$vnetname="vnet1"
$subnet1="Subnet1"

az network vnet subnet update --resource-group $resourcegroup --name $subnet1 --vnet-name $vnetname --network-security-group $nsgname
