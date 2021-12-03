function Invoke-Part1 {
    param (
        [int[]]$depths
    )
    
    $count = -1 # Skip the first

    foreach ($depth in $depths) {
        $count += [int]($depth -gt $previousDepth)
        $previousDepth = $depth

    }

    $count

} # Invoke-Part1

$depths = Get-Content $PSCommandPath.Replace('.ps1', '-input.txt')
Invoke-Part1 -depths $depths