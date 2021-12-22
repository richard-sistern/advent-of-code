# TODO
# Raw input required?

using namespace System.Collections.Generic # Queue

$nl = [Environment]::NewLine

function Invoke-Part1 {
    param (
        [System.Collections.ArrayList]$numbers
    )

    $bingoCaller =  [Queue[int]]($numbers[0].split(','))
    # $bingoCaller.Peek()
    
    $numbers.RemoveAt(0) # Remove bingo draw from cards


    $numbers = $numbers.Trim() -match '.+'
    
    foreach ($set in $numbers) {
        # 14 21 17 24  4
        # 10 16 15  9 19
        # 18  8 23 26 20
        # 22 11 13  6  5
        #  2  0 12  3  7

        $lines = $set -split $nl
        for ($i = 0; $i -lt $lines.Count; $i++) {
            # 14 21 17 24  4
            $i
            $lines[$i]
        }
        foreach ($line in $set -split $nl) {
            # 14 21 17 24  4

            $line = $line -split '\s+' -match '\S'
           # $line[0]
            #$line.count
  

        }
        Write-Output "....SET...."
        # Match any white-space: \s+ 
        # Match any non-white-space: \S
       
        #$a = $set -split [Environment]::NewLine
        # $b = $a[0] -split '\s+' -match '\S'
        # $b.count

        #$set = $set -split '\s+' -match '\S'

        for ($i = 0; $i -lt $set.Count; $i++) {
            #$set[$i]
        }
        #$set
       
        
        #$card = 
    }
    
 
} # Invoke-Part1

$numbers = Get-Content $PSCommandPath.Replace('.ps1', '-test-input.txt') -Delimiter ([System.Environment]::NewLine * 2) 
Invoke-Part1 -numbers $numbers