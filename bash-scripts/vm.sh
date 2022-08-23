#for disk and VM
$resourcegroup="script-test"
$location1="westeurope"

#for disk
$diskname="diskvm1"
$disksize=32
$image="Canonical:UbuntuServer:18.04-LTS:18.04.202002180"

#for VM
$vmname="vm1"
$vmpricing="Standard_DS1_v2"
$vnetname="vnet1"
$subnet1="Subnet1"
$reservedIP="40.113.96.27"
$dnsName="vm1-ppaszek-cli"

az disk create --name $diskname --resource-group $resourcegroup --location $location1 --os-type Linux --size-gb $disksize --image-reference $image

az vm create --name $vmname --resource-group $resourcegroup --attach-os-disk $diskname --os-type Linux --vnet-name $vnetname --subnet $subnet1 --os-disk-delete-option Delete --size $vmpricing --public-ip-address $reservedIP --public-ip-address-dns-name $dnsName  --generate-ssh-keys --public-ip-address-allocation static
