function Check-Slope {
  param (
    [string[]] $map,
    [int] $right,
    [int] $down
  )

  [int] $line_count = 0
  [int] $trees = 0
  [int] $x = 0

  Foreach ($line in $map)
  {
    if ([array]::IndexOf($map, $line) -eq $line_count)
    {
      if ($x -gt $line.length -1) {
        $x = $x - $line.Length
      }

      if ($line[$x] -eq '#') {
        $trees += 1
      }

      $line_count += $down

      $x += $right
    }
  }

  $trees
  } # Check-Slope

function Invoke-Part1 {
  param (
    [string[]] $map
  )

  Check-Slope -Map $map -Right 3 -Down 1
} # Invoke-Part1

function Invoke-Part2 {
  param (
    [string[]] $map
  )

  $total = 1

  $total = $total * (Check-Slope -Map $map -right 1 -down 1)
  $total = $total * (Check-Slope -Map $map -right 3 -down 1)
  $total = $total * (Check-Slope -Map $map -right 5 -down 1)
  $total = $total * (Check-Slope -Map $map -right 7 -down 1)
  $total = $total * (Check-Slope -Map $map -right 1 -down 2)

  $total
} # Invoke-Part2

#[string[]] $map = Get-Content $PSCommandPath.Replace('.ps1', '-input.txt')
#Invoke-Part1 -Map $map
