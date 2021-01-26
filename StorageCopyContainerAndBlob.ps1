$rg = "rg-storageaccount-001"
$sourceStorageAccount = "stcanadacentral416" 
$sourceStorageKey = (Get-AzStorageAccountKey -Name $sourceStorageAccount -ResourceGroupName $rg)[0].Value
$destStorageAccount = "stcanadacentral647" 
$destStorageKey = (Get-AzStorageAccountKey -Name $destStorageAccount -ResourceGroupName $rg)[0].Value
$sourceStorageContext = New-AzStorageContext -StorageAccountName $sourceStorageAccount -StorageAccountKey $sourceStorageKey
$destStorageContext = New-AzStorageContext -StorageAccountName $destStorageAccount -StorageAccountKey $destStorageKey
$containers = Get-AzStorageContainer -Context $sourceStorageContext

foreach($container in $containers)
{
    $containerName = $container.Name
    if (!((Get-AzStorageContainer -Context $destStorageContext) | Where-Object { $_.Name -eq $containerName }))
    {   
        Write-Output "Creating new container $containerName"
        New-AzStorageContainer -Name $containerName -Permission Off -Context $destStorageContext -ErrorAction Stop
    }

    $blobs = Get-AzStorageBlob -Context $sourceStorageContext -Container $containerName
    $blobCpyAry = @() 

    foreach ($blob in $blobs)
    {
       $blobName = $blob.Name
       Write-Output "Copying $blobName from $containerName"
       $blobCopy = Start-AzStorageBlobCopy -Context $sourceStorageContext -SrcContainer $containerName -SrcBlob $blobName -DestContext $destStorageContext -DestContainer $containerName -DestBlob $blobName
       $blobCpyAry += $blobCopy
    }

    foreach ($blobCopy in $blobCpyAry)
    {
        $blobCopy 
    }
}