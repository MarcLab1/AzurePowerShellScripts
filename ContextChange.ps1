$contexts = Get-Azcontext –ListAvailable
Set-AzContext $contexts[0]

$contexts[0] | Rename-AzContext -TargetName "Sub1"
Get-AzContext -ListAvailable

Get-AzSubscription

