$localStorageContext = New-AzStorageContext -Local
$localStorageContext
$containerName = "container001"

$localStorageContext | New-AzStorageContainer -Name $containerName

$localStorageContext | Set-AzStorageBlobContent dogs1.txt -Container $containerName
$localStorageContext | Set-AzStorageBlobContent dogs2.txt -Container $containerName
$localStorageContext | Set-AzStorageBlobContent dogs3.txt -Container $containerName


