$rg = "rg-vm-007"
$loc = "canadacentral"

#New-AzResourceGroup -Name $rg -Location $loc

New-AzResourceGroupDeployment `
  -Name ExampleDeployment `
  -ResourceGroupName $rg `
    -Location $loc `
  -TemplateUri https://raw.githubusercontent.com/MarcLab1/PowerShellScripts/master/vm_parameters.json
