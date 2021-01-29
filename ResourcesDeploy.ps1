$rg = "rg-testing-008"
$loc = "canadacentral"
$templateFile = "F:\Azure\PowerShellScripts\resourcesdeploy.json"
$parameterFile= "F:\Azure\PowerShellScripts\resourcesdeploy.parameters.json"

New-AzResourceGroup -ResourceGroupName $rg -Location $loc

New-AzResourceGroupDeployment `
  -Name addappserviceplan `
  -ResourceGroupName $rg `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile
