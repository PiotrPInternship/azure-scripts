$accountname='ppaszek2'
$resourcegroup='storage-resource-group'
$location1='westeurope'
$pricing_tier='Hot'
$skuname= 'Standard_LRS'

New-AzStorageAccount -Name $accountname -ResourceGroupName $resourcegroup -Location $location1 -AccessTier $pricing_tier -SkuName $skuname