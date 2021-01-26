$tags = @{"Class"="Az204"; "Branch"="Home"}

$rg = New-AzResourceGroup -Name "rg-testing-123" -Location canadacentral -Tag $tags
$rg.Tags

$tags += @{Location="Toronto"}
$tags

(New-AzResourceGroup -Name "rg-testing-456" -Location canadacentral -Tag $tags).Tags

Get-AzTag -ResourceId $rg.ResourceId 
Get-AzTag -ResourceId (Get-AzResourceGroup -Name "rg-testing-456").ResourceId 

$newTags = @{"Street"="Drive"; "Town"="Uptown"}
Update-AzTag -ResourceId $rg.ResourceId -Tag $newTags -Operation Replace
$rg.Tags

#apply tags to a previously created resource
Set-AzStorageAccount -name "stcanadacentral416" -ResourceGroupName "rg-storageaccount-001" -Tag $tags

