# resourcegroup ='storage-resource-group'
# az deployment group create -g $resourcegroup -f .\rgclean.bicep --mode Complete

# resourcegroup='storage-resource-group'
# az resource list --resource-group $resourcegroup

resourcegroup='storage-resource-group'
resources="$(az resource list --resource-group $resourcegroup | grep id | awk -F \" '{print $4}')"
for id in $resources; do
    echo $id
    az resource delete --resource-group $resourcegroup --ids "$id" --verbose 
done