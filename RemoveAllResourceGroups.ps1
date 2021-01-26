<# remove ALL resource groups.  Buyer beware with this script #>
$rsList = Get-AzResourceGroup 
foreach($rs in $rsList)
{
Remove-AzResourceGroup -Name $rs.ResourceGroupName -AsJob -Force
}