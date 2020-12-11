function Invoke-Part1 {
    param (
        $forms
    )
    
    $total = $forms | ForEach-Object {
        ( $_ -split "" | Where-Object { $_ -match "[a-z]" } | Select-Object -Unique ).Count
    } | Measure-Object -Sum
    $total.Sum
} # Invoke-Part1

#$forms = Get-Content $PSCommandPath.Replace('.ps1', '-input.txt') -Delimiter ([System.Environment]::NewLine * 2)
#Invoke-Part1 -forms $forms

function Invoke-Part2 {
    param (
        $forms
    )
    
    $total = $forms | ForEach-Object {
        $i = ( $_ -split [System.Environment]::NewLine | Where-Object { $_ } ).count
        ( $_ -split "" | Where-Object { $_ -match "[a-z]" } | Group-Object | Where-Object { $_.count -eq $i }  | Measure-Object ).Count
    } | Measure-Object -Sum
    $total.sum
} # Invoke-Part2

$forms = Get-Content $PSCommandPath.Replace('.ps1', '-input.txt') -Delimiter ([System.Environment]::NewLine * 2)
Invoke-Part2 -forms $forms

  