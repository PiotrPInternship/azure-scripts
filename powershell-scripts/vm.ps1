#for disk and VM
$resourcegroup="script-test"
$location1="westeurope"

#for disk
$diskname="diskvm1"
$disksize=32
$image=@{Id = '/Subscriptions/06c54ca3-cc90-4a21-93dd-6de69f5ac7ef/Providers/Microsoft.Compute/Locations/westeurope/Publishers/Canonical/ArtifactTypes/VMImage/Offers/UbuntuServer/Skus/18.04-LTS/Versions/18.04.202002180'; Lun=1}
$skuname="StandardSSD_LRS"

#for VM
$vmname="vm1"
$vmsize="Standard_DS1_v2"
$vnetname="vnet1"
$subnet1="Subnet1"
$reservedIP="20.101.103.47"
$dnsName="vm1-ppaszek-cli"

#getting the VMimage

#first search

# Get-AzVMImage -Location "West Europe" -PublisherName "Canonical" -Offer "UbuntuServer" -Skus "18.04-LTS"

#exact image search to get ID

# Get-AzVMImage -Location "West Europe" -PublisherName "Canonical" -Offer "UbuntuServer" -Skus "18.04-LTS" -Version "18.04.202002180"

# creating disk

$configuredisk = New-AzDiskConfig -Location $location1 -DiskSizeGB $disksize -SkuName $skuname -OsType Linux -CreateOption 'FromImage' -GalleryImageReference $image
New-AzDisk -ResourceGroupName $resourcegroup -DiskName $diskname $configuredisk

#creating VM

$cred = Get-Credential -Message "Enter a username and password for the virtual machine:"

$VirtualMachine = New-AzVMConfig -VMName $vmname -VMSize $vmsize
$VirtualMachine = Set-AzVMOSDisk -VM $vmname -Name "diskvm1.vhd" -VhdUri "https://mystorageaccount.blob.core.windows.net/disks/" -CreateOption Attach -Linux

$vmparameters = @{
    ResourceGroupName = $resourcegroup
    Name = $vmname
    Location = $location1
    Credential = $cred
    VirtualNetworkName = $vnetname
    SubnetName = $subnet1
  }

if(-not [string]::IsNullOrWhiteSpace($dnsName)){
    $vmParams['DomainNameLabel'] = $dnsName
}

if(-not [string]::IsNullOrWhiteSpace($reservedIP)){
    $vmParams['PublicIpAddressName'] = $reservedIP
}

New-AzVM @vmParams -VM $VirtualMachine -Verbose
