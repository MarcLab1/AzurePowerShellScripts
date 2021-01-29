$rg = "rg-keyvault-001"
$loc = "canadacentral"
$templateFile = "F:\Azure\PowerShellScripts\keyvaultdeploy.json"

New-AzResourceGroup -ResourceGroupName $rg -Location $loc

New-AzResourceGroupDeployment `
  -Name keyvaultdeploy `
  -ResourceGroupName $rg `
  -TemplateFile $templateFile 