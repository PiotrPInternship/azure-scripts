# $resourcegroup ='storage-resource-group'
# New-AzResourceGroupDeployment -ResourceGroupName $resourcegroup -Mode Complete -TemplateFile .\rgclean.bicep -Force -Verbose

$resourcegroup='storage-resource-group'

get-AZresource -ResourceGroupName $resourcegroup | Remove-AzResource -Forc