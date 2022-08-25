$resourcegroup ='storage-resource-group'
$appName='Webapp-ppaszek'
# Schedule a backup every day, beginning in one hour, and retain for 10 days
Edit-AzWebAppBackupConfiguration -ResourceGroupName $resourcegroup -Name $appName -StorageAccountUrl $sasUrl -FrequencyInterval 1 -FrequencyUnit Day -KeepAtLeastOneBackup -StartTime (Get-Date).AddHours(1) -RetentionPeriodInDays 10

# List statuses of all backups that are complete or currently executing.
Get-AzWebAppBackupList -ResourceGroupName myResourceGroup -Name $webappname

# (OPTIONAL) Change the backup schedule to every 2 days

# $configuration = Get-AzWebAppBackupConfiguration -ResourceGroupName myResourceGroup `
# -Name $webappname
# $configuration.FrequencyInterval = 2
# $configuration | Edit-AzWebAppBackupConfiguration