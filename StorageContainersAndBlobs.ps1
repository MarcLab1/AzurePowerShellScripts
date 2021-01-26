$rg = New-AzResourceGroup -Name "rg-storageaccount-001" -Location canadacentral 
$rg

<# Create storage account, and 2 containers inside that storage account #>
New-AzStorageAccount -Name stcanadacentral416 -Location canadacentral -ResourceGroupName "rg-storageaccount-001" -SkuName "Standard_LRS"
Set-AzCurrentStorageAccount -ResourceGroupName "rg-storageaccount-001" -AccountName stcanadacentral416
New-AzStorageContainer container001 
New-AzStorageContainer -Name container002 <# -Name is implicit, we don't need to specify #>
New-AzStorageContainer container003

<# Create some test files to play around with#>
New-Item dogs1.txt
New-Item dogs2.txt
New Item dogs3.txt

<# upload files to container #>
Set-AzStorageBlobContent dogs1.txt -Container container001
Set-AzStorageBlobContent dogs2.txt -Container container001
Set-AzStorageBlobContent dogs3.txt -Container container001


Get-AzStorageAccount | Select-Object StorageAccountName, Location
Get-AzStorageContainer   
Get-AzStorageBlob -Container container001

<# copy single blob between 2 containers in same storage acccont #>
Start-AzStorageBlobCopy -SrcBlob dogs1.txt -SrcContainer container001 -DestContainer container002
Get-AzStorageBlob -Container container002

<# copy all blobs between 2 containers in same storage acccont #>
Get-AzStorageBlob -Container container001 | Start-AzStorageBlobCopy -DestContainer container003
Remove-AzStorageBlob

