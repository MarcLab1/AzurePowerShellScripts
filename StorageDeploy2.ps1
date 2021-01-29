$rg = "rg-demo-011"
$loc = "canadacentral"
$templateFile = "F:\Azure\PowerShellScripts\storagedeploy2.json"

New-AzResourceGroup -ResourceGroupName $rg -Location $loc

New-AzResourceGroupDeployment `
  -Name storagedeploy2 `
  -ResourceGroupName $rg `
  -TemplateFile $templateFile 
  #`
  #-TemplateParameterFile $parameterFile