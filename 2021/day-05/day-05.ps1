function Invoke-Part1 {
    param (
        $lines
    )

    # Calculate size of grid
    $max = ($lines | ForEach-Object { $_.Split(' -> ').Split(',') } | Measure-Object -Maximum).Maximum
    $max = ($splitLines | Measure-Object -Maximum).Maximum
    $max += 1 # Need to increase grid size

    $grid = [int[,]]::New($max, $max)

    foreach ($line in $lines) {
        [int[]]($x1, $y1, $x2, $y2) = $line.Split(' -> ').Split(',')
        
        # Always want to count up...
        if ($y2 -lt $y1) {$y2, $y1 = $y1, $y2}
        if ($x2 -lt $x1) { $x2, $x1 = $x1, $x2}


        if ($x1 -eq $x2) {
            for ($y = $y1; $y -lt $y2+1; $y++) {
                $grid[$y, $x1] += 1
            }
        }
        elseif ($y1 -eq $y2) {
            for ($x = $x1; $x -lt $x2+1; $x++) {
               $grid[$y1, $x] += 1
            }
        }
    }

    ($grid -gt 1).count
}

$lines = Get-Content $PSCommandPath.Replace('.ps1', '-input.txt') 
Invoke-Part1 -lines $lines

# $sum = 0
# $tests = for($i = 0; $i -lt 10; $i++) {(Measure-Command { .\day-05.ps1 }).TotalSeconds}
# $tests | % { $sum += $_ }; $sum/10