$resourcegroup ='storage-resource-group'
$location1='westeurope'
$serviceplan='myserviceplan1'
$price_tier='Basic'
$appName='Webapp-ppaszek'
New-AzAppServicePlan -ResourceGroupName $resourcegroup -Name $serviceplan -Location $location1 -Tier $price_tier -NumberofWorkers 2  -Linux
New-AzWebApp -ResourceGroupName $resourcegroup -Name $appName -Location $location1 -AppServicePlan $serviceplan -ContainerImageName mcr.microsoft.com/dotnet/samples:aspnetapp 
