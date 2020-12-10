function Invoke-Part1 {
    param (
        $cards
    )
    #$cards.count

    $seats = $cards | ForEach-Object {
        [convert]::ToInt32(($_ -replace 'B|R', 1 -replace 'F|L', 0), 2)
    } | Sort-Object
    
    $seats[-1]
} # Invoke-Part1

# $cards = Get-Content $PSCommandPath.Replace('.ps1', '-input.txt')
# Invoke-Part1 -card $cards

function Invoke-Part2 {
    param (
        $cards
    )
    #$cards.count

    $seats = $cards | ForEach-Object {
        [convert]::ToInt32(($_ -replace 'B|R', 1 -replace 'F|L', 0), 2)
    } | Sort-Object
    
    #$seats[0]
    #$seats[-1]
    $seats[0]..$seats[-1] | Where-Object { $_ -notin $seats }
} # Invoke-Part2

#$cards = Get-Content $PSCommandPath.Replace('.ps1', '-input.txt')
#Invoke-Part2 -card $cards