New-AzResourceGroup -Name "rg-storageaccount-001" -Location canadacentral 

New-AzStorageAccount -Name stcanadacentral416 -Location canadacentral -ResourceGroupName rg-storageaccount-001 -SkuName "Standard_LRS"
Set-AzCurrentStorageAccount -ResourceGroupName rg-storageaccount-001 -AccountName stcanadacentral416
New-AzStorageContainer container001 
New-AzStorageContainer -Name container002 <# -Name is implicit, we don't need to specify #>
New-AzStorageContainer container003 

Set-AzStorageBlobContent dogs1.txt -Container container001
Set-AzStorageBlobContent dogs2.txt -Container container001
Set-AzStorageBlobContent dogs3.txt -Container container001

New-AzStorageAccount -Name stcanadacentral647 -Location canadacentral -ResourceGroupName rg-storageaccount-001 -SkuName "Standard_LRS"
Set-AzCurrentStorageAccount -ResourceGroupName rg-storageaccount-001 -AccountName stcanadacentral647
New-AzStorageContainer container004
New-AzStorageContainer container005 
New-AzStorageContainer container006

