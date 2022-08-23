echo "Creating NSG and rule"
$nsgname="NSG1"
$resourcegroup="script-test"
$location1="westeurope"

$arrayofrules=@('myfirstrule','Inbound','Allow','Tcp','1000','VirtualNetwork','*','Internet','*')
# rule arguments
# [0]rulename
# [1]Inbound/Outbound 
# [2]Alow/Deny
# [3]Tcp/Udp/*
# [4]priority: between 100 and 4096
# [5]Source IP range/*/VirtualNetwork/AzureLoadBalancer/Internet
# [6]Source port range: numer between 0 and 65535, port range between 0 and 65535 or *(all)
# [7]Destination IP range/*/VirtualNetwork/AzureLoadBalancer/Internet
# [8]Destination port range: numer between 0 and 65535, port range between 0 and 65535 or *(all)


$nsgcreate = New-AzNetworkSecurityGroup -Name $nsgname -ResourceGroupName $resourcegroup  -Location $location1

$nsgedit = Get-AzNetworkSecurityGroup -Name $nsgname

$nsgedit | Add-AzNetworkSecurityRuleConfig -Name $arrayofrules[0] `
    -Direction $arrayofrules[1] `
    -Access $arrayofrules[2] `
    -Protocol $arrayofrules[3] `
    -Priority $arrayofrules[4] `
    -SourceAddressPrefix $arrayofrules[5] `
    -SourcePortRange $arrayofrules[6] `
    -DestinationAddressPrefix $arrayofrules[7] `
    -DestinationPortRange $arrayofrules[8]
$nsgedit | Set-AzNetworkSecurityGroup
