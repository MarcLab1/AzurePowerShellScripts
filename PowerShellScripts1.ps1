Connect-AzAccount

<# create some resource groups #>
$count = 5
for($i = 0; $i -lt $count; $i++)
{
    New-AzResourceGroup -Name "rs-vscode-$i" -Location canadacentral 
}

<# remove those same resource groups #>
for($i = 0; $i -lt $count; $i++)
{
    Remove-AzResourceGroup -Name "rs-vscode-$i" -AsJob -Force
}

<# Create an AppServicePlan inside a new resource group; Free Tier of course :) #>
New-AzResourceGroup -Name "rs-webapp-001" -Location canadacentral 
New-AzAppServicePlan -Name asp-canadacentral-001 -Location canadacentral -Tier free -Resourcegroupname rs-webapp-001

<# Create a Web App using the asp inside the same resource group #>
New-AzWebApp -Name webapp-canadacentral-001 -Location canadacentral -AppServicePlan asp-canadacentral-001 -ResourceGroupName rs-webapp-001

<# Show all resources#>
Get-AzResource | Select-Object Name, ResourceGroupName, Location, ResourceType

<#variables can be reassigned#>
$count = 3
for($i = 0; $i -lt $count; $i++)
{
    New-AzResourceGroup -Name "rs-vscode-00$i" -Location canadacentral 
}

<# remove ALL resource groups.  Buyer beware with this script #>
$rsList = Get-AzResourceGroup 
foreach($rs in $rsList)
{
Remove-AzResourceGroup -Name $rs.ResourceGroupName -AsJob -Force
}

<# Get ALL resource groups #>
Get-AzResourcegroup | Select-Object resourcegroupname, ProvisioningState

New-AzResourceGroup -Name rs-testing-416 -Location canadacentral

<# Create storage account #>
New-AzStorageAccount -Name stcanadacentral416 -Location canadacentral -ResourceGroupName rs-testing-416 -SkuName "Standard_LRS" -AsJob 

Remove-AzStorageAccount -Name stcanadacentral647 -ResourceGroupName rs-testing-416 -AsJob
Remove-AzResourceGroup -Name rs-testing-416 -AsJob

Get-AzResource