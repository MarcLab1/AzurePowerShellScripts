$rg="rg-asp-001"
$asp = "asp-canadacentral-001"
$loc = "canadacentral"

New-AzResourceGroup -Name $rg -Location canadacentral 
New-AzAppServicePlan -Name $asp -Location $loc -ResourceGroupName $rg -Tier Free

Get-AzAppServicePlan -ResourceGroupName $rg -Name $asp
Set-AzAppServicePlan -ResourceGroupName $rg -Name $asp -PerSiteScaling $true

$webapp = "webapp905er"
#Create a App Service
New-AzWebApp -Name $webapp -Location $loc -AppServicePlan $asp -ResourceGroupName $rg

#Remove WebApp
Remove-AzWebApp -ResourceGroupName $rg -Name $webapp

#Start Web App
Start-AzWebApp -ResourceGroupName $rg -Name $webapp -
#Stop Web App
Stop-AzWebApp -ResourceGroupName $rg -Name $webapp
#Restart Web App
Restart-AzWebApp -ResourceGroupName $rg -Name $webapp

#To get the Tier of an app service plan
(Get-AzAppServicePlan -Name $asp).Sku.Tier #sometime this doesn't return correctly, use variables instead?
$aspObject = Get-AzAppServicePlan -Name $asp

$tier1 = $aspObject.Sku.Tier
$tier1

# Web App Details
$state = (Get-AzWebApp -Name $webapp).State
$state

