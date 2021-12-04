function Invoke-Part1 {
    param (
        [string[]]$commands
    )
    
    foreach ($command in $commands) {
        $direction, [int]$distance = $command.split(' ')
        
        switch ($direction) {
            "forward" {$position += $distance}
            "down" {$depth += $distance}
            "up" {$depth -= $distance}
        }
    }

    $position * $depth
} # Invoke-Part1

$commands = Get-Content $PSCommandPath.Replace('.ps1', '-input.txt')
Invoke-Part1 -commands $commands