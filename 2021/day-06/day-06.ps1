function Invoke-Part1 {
    param (
        [string]$seed,
        [int]$days
    )

    [int[]]$fishes = $seed.Split(',')

    for ($i = 0; $i -lt $days; $i++) {
        # Write-Output "Day: $i - $fishes"
        Write-Output "Day: $i"
        
        for ($f = 0; $f -lt $fishes.Count; $f++) {
            if ($fishes[$f] -gt 0) {
                $fishes[$f] -= 1 
            }
            else {
                $fishes += 9 # 8 + 1
                $fishes[$f] = 6
            }
        }
    }
    $fishes.count
} 

# Invoke-Part1 -seed "3,4,3,1,2" -days 80
$seed = Get-Content $PSCommandPath.Replace('.ps1', '-input.txt')
Invoke-Part1 -seed $seed -days 80