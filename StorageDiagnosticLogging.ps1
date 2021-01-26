#Enable diagnostic logs in a storage account
$rg1 = "rg-storageaccount-001"
$rg2 = "rg-asp-001"
$loc = "canadacentral"
$storageacct = "stcanadacentral416"
$asp = "asp-canadacentral-001"
$webapp = "webapp905er"
$diagname = "diagsetting1"

New-AzResourceGroup -Name $rg1 -Location $loc
New-AzResourceGroup -Name $rg2 -Location $loc

New-AzStorageAccount -Name stcanadacentral416 -Location $loc -ResourceGroupName $rg1 -SkuName "Standard_LRS"
$storage = Get-AzStorageAccount -ResourceGroupName $rg1 -Name $storageacct

New-AzAppServicePlan -Name $asp -Location $loc -ResourceGroupName $rg2 -Tier Free
New-AzWebApp -Name $webapp -Location $loc -AppServicePlan $asp -ResourceGroupName $rg2

$webappObject = Get-AzWebApp -Name $webapp -ResourceGroupName $rg2

Set-AzDiagnosticSetting -Name $diagname -ResourceId $webappobject.id -StorageAccountId $storage.id -Enabled $true 
