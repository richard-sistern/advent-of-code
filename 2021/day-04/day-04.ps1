# TODO
# Raw input required?

using namespace System.Collections.Generic # Queue

function Invoke-Part1 {
    param (
        [System.Collections.ArrayList]$numbers
    )

    $bingoCaller =  [Queue[int]]($numbers[0].split(','))
    $bingoCaller.Peek()
    
    $numbers.RemoveAt(0) # Remove bingo draw from cards
    
    Write-Output "................."
    
    $numbers[0] 

    Write-Output "................."

    $numbers[1]

    Write-Output "................."

    $numbers[2]
} # Invoke-Part1

$numbers = Get-Content $PSCommandPath.Replace('.ps1', '-test-input.txt') -Delimiter ([System.Environment]::NewLine * 2) 
Invoke-Part1 -numbers $numbers