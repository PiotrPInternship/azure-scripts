#!/bin/bash
echo "Assigning NSG to VNet subnets"
$nsgname='NSG1'
$resourcegroup='script-test'
$vnetname='vnet1'

#other try to set all subnets which didnt work yet .. :)
# $subnetsarray=@('subnet1','subnet2','subnet3','subnet4')

$nsgget = Get-AzNetworkSecurityGroup -Name $nsgname -ResourceGroupName $resourcegroup
$vnetget = Get-AzVirtualNetwork -Name $vnetname -ResourceGroupName $resourcegroup

# single subnet to test
# $subnet='subnet1'
# $prefix='10.1.0.0/24'

$subnets = 
@'
SubnetName,AddressPrefix
"subnet1","10.1.0.0/24" 
"subnet2","10.1.1.0/24"
"subnet3","10.1.2.0/24"
"subnet4","10.1.3.0/24"
'@ | 
ConvertFrom-Csv


foreach ($subnet in $subnets) {
 
    $Params = @{
        'VirtualNetwork'       = $vnetget
        'Name'                 = $subnet.SubnetName
        'AddressPrefix'        = $subnet.AddressPrefix
        'NetworkSecurityGroup' = $nsgget
    }
    Set-AzVirtualNetworkSubnetConfig @Params
    Set-AzVirtualNetwork -VirtualNetwork $vnetget
}

#other try to set all subnets which didnt work yet .. :)
# foreach ($subnet in $subnetsarray){
#     $subnetget = Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnetname -Name $subnet
#     $subnetget.NetworkSecurityGroup = $nsgget
#     $set = Set-AzVirtualNetwork -VirtualNetwork $vnetget
# }
