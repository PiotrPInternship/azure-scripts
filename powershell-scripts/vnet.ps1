# #creating Vnet
# Write-Output "creating Vnet"
# $vnet = @{
#     Name = 'vnet1'
#     ResourceGroupName = 'script-test'
#     Location = 'westeurope'
#     AddressPrefix = '10.1.0.0/16'    
# }
# $vnetcreate = New-AzVirtualNetwork @vnet

# $subnet = @{
#     Name = 'subnet1'
#     AddressPrefix = '10.1.0.0/24'
# }
# $subnetcreate = New-AzVirtualNetworkSubnetConfig @subnet
# $subnetupdate = Add-AzVirtualNetworkSubnetConfig @subnet -VirtualNetwork $vnet #someghow it doesnt work

#creating Vnet
Write-Output "creating Vnet"
$vnet = @{
    Name = 'vnet1'
    ResourceGroupName = 'script-test'
    Location = 'westeurope'
    AddressPrefix = '10.1.0.0/16'    
}
$virtualNetwork = New-AzVirtualNetwork @vnet
# Subnets
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
 
    $dmz = New-AzVirtualNetworkSubnetConfig -Name $subnet.SubnetName -AddressPrefix $subnet.AddressPrefix
    $updatedvnet=Add-AzVirtualNetworkSubnetConfig -Name $dmz.Name -VirtualNetwork $virtualNetwork -AddressPrefix $dmz.AddressPrefix
    $updatedvnet | Set-AzVirtualNetwork
}
