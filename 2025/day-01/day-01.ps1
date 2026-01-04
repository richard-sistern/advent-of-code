function Invoke-Part1 {
  [CmdletBinding()]

  param (
    [string[]]$rotations
  )

  $position = 50
  $password = 0
  
  Foreach ($rotation in $rotations) {
    Write-Verbose "Rotation input: $rotation"

    $direction, [int]$distance = [regex]::Matches($rotation, '[LR]+|\d+') | ForEach-Object { $_.Value }
    Write-Verbose "Direction: $direction and Distance: $distance"

    switch ($direction) {
      'L' { $position -= $distance }
      'R' { $position += $distance }
    }

    Write-Verbose "Position before wrap: $position"
    $position %= 100
    Write-Verbose "Position after wrap (mod 100): $position"
  
    if ($position -eq 0) 
    { 
      $password += 1 
    }
  }

  return $password
} # Invoke-Part1

function Invoke-Part2 {
  [CmdletBinding()]

  param (
    [string[]]$rotations
  )

  $position = 50
  $password = 0
  
  Foreach ($rotation in $rotations) {
    Write-Verbose "Rotation input: $rotation"
  }

  return $password
} # Invoke-Part2

$aoc_input = Get-Content -Path .\day-01-input.txt

Invoke-Part1 -rotations $aoc_input
Invoke-Part2 -Rotations @("L68", "L30", "R48", "L5", "R60", "L55", "L1", "L99", "R14", "L82") -Verbose