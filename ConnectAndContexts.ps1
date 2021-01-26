Connect-AzAccount

$contexts = Get-AzContext –ListAvailable
$contexts 
$sub = $contexts[0]

Set-AzContext $sub

Select-AzContext $sub.Name
