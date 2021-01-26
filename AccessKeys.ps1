$nl = [Environment]::NewLine
$rs = "rg-storageaccount-001"
$storageAccount = "stcanadacentral416" 
$storageAccountKey = Get-AzStorageAccountKey -Name $storageAccount -ResourceGroupName $rs

$storageAccountKey
$nl
$storageAccountKey | Where-Object {$_.KeyName -eq "key1"}
($storageAccountKey | Where-Object {$_.KeyName -eq "key1"}).Value
$nl
$storageAccountKey[0].Value
$storageAccountKey[1].Value
$nl
"Keys Length = " + $storageAccountKey.Length

