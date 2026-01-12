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
    $position = ($position % 100 + 100) % 100
    Write-Verbose "Position after wrap (mod 100): $position"
  
    if ($position -eq 0) { $password += 1 }
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

    $direction, [int]$distance = [regex]::Matches($rotation, '[LR]+|\d+') | ForEach-Object { $_.Value }
    Write-Verbose "Direction: $direction and Distance: $distance"

    switch ($direction) {
      'L' { 
        if ($position -eq 0) {
          $password += [Math]::Floor($distance / 100)
        } elseif ($distance -ge $position) {
          $password += 1 + [Math]::Floor(($distance - $position) / 100)
        }

        $position -= $distance
      }
      'R' { 
        $password += [Math]::Floor(($position + $distance) / 100)
        $position += $distance
      }
    }

    # Powershell modulo can return negative numbers, so adjust accordingly
    $position = ($position % 100 + 100) % 100
    Write-Verbose "Position after wrap (mod 100): $position"
  }

  return $password
} # Invoke-Part2

$aoc_input = $PSCommandPath.Replace('.ps1', '-input.txt')

Invoke-Part1 -rotations $aoc_input
Invoke-Part2 -rotations $aoc_input
