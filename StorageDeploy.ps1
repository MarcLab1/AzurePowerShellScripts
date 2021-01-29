$rg = "rg-testing-005"
$loc = "canadacentral"
$templateFile = "F:\Azure\PowerShellScripts\storagedeploy.json"
$templateParams = "F:\Azure\PowerShellScripts\storagedeploy.parameters.json"

New-AzResourceGroup -ResourceGroupName $rg -Location $loc

New-AzResourceGroupDeployment `
  -Name storagedeploy `
  -ResourceGroupName $rg `
  -TemplateFile $templateFile `
  -TemplateParameterFile $templateParams