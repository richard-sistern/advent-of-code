function Invoke-Part1 {
    param (
        $forms
    )
    #$Questions = Get-Content .\6.input.txt -Delimiter "`n`n"
    $total = $forms | ForEach-Object {
        ( $_ -split "" | Where-Object { $_ -match "[a-z]" } | Select-Object -Unique  ).Count
    } | Measure-Object -Sum
    $total.Sum
} # Invoke-Part1

#$forms = Get-Content $PSCommandPath.Replace('.ps1', '-input.txt') -Delimiter ([System.Environment]::NewLine * 2)
#Invoke-Part1 -forms $forms
