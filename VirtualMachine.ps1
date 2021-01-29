$rg = "rg-vm-007"
$loc = "canadacentral"
$templateFile = "F:\Azure\PowerShellScripts\template_vm.json"
$parameterFile= "F:\Azure\PowerShellScripts\parameters.json"

New-AzResourceGroup -ResourceGroupName $rg -Location $loc

New-AzResourceGroupDeployment `
  -Name addappserviceplan `
  -ResourceGroupName $rg `
  -TemplateFile $templateFile 
  #`
  #-TemplateParameterFile $parameterFile
