#for disk and VM
resourcegroup="script-test"
location1="westeurope"

#for disk
diskname="diskvm1"
disksize=32
image="Canonical:UbuntuServer:18.04-LTS:18.04.202002180"

#for VM
vmname="vm1"
vmpricing="Standard_DS1_v2"
vnetname="vnet1"
subnet1="Subnet1"
reservedIP="20.101.103.47"
dnsName="vm1-ppaszek-cli"

az disk create --name $diskname --resource-group $resourcegroup --location $location1 --os-type Linux --size-gb $disksize --image-reference $image

#clear VM

az vm create --name $vmname --resource-group $resourcegroup --attach-os-disk $diskname --os-type Linux --vnet-name $vnetname --subnet $subnet1 --os-disk-delete-option Delete --size $vmpricing --public-ip-address-allocation static

#VM with reserved IP

# az vm create --name $vmname --resource-group $resourcegroup --attach-os-disk $diskname --os-type Linux --vnet-name $vnetname --subnet $subnet1 --os-disk-delete-option Delete --size $vmpricing --public-ip-address $reservedIP --public-ip-address-dns-name static

#VM with DNS

# az vm create --name $vmname --resource-group $resourcegroup --attach-os-disk $diskname --os-type Linux --vnet-name $vnetname --subnet $subnet1 --os-disk-delete-option Delete --size $vmpricing --public-ip-address-dns-name $dnsName --public-ip-address-allocation static

#VM with reserved IP and DNS

# az vm create --name $vmname --resource-group $resourcegroup --attach-os-disk $diskname --os-type Linux --vnet-name $vnetname --subnet $subnet1 --os-disk-delete-option Delete --size $vmpricing --public-ip-address $reservedIP --public-ip-address-dns-name $dnsName --public-ip-address-allocation static
