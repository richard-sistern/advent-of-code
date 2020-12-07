function Invoke-Part1 {
  param (
    [string[]] $map
  )

  [int] $x = 0
  [int] $trees = 0

  Foreach ($line in $map)
  {
    # $x = 0, $line.length = 1
    if ($x -gt $line.length - 1) {
      $x = $x - $line.Length
    }

    if ($line[$x] -eq '#') {
      $trees += 1
    }

    $x += 3
  }
  $trees
}

#[string[]] $map = Get-Content $PSCommandPath.Replace('.ps1', '-input.txt')
#Invoke-Part1 -Map $map
