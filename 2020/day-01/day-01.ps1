function Invoke-Part1 {
  param (
    [int[]]$entries,
    [int]$target
  )
  Foreach ($first_entry in $entries) {
    Foreach ($second_entry in $entries) {
      if ($first_entry + $second_entry -eq $target) {
        return $first_entry * $second_entry
      }
    }
  }
} # Invoke-Part1

function Invoke-Part2 {
  param (
    [int[]]$entries,
    [int]$target
  )
  Foreach ($first_entry in $entries) {
    Foreach ($second_entry in $entries) {
      Foreach ($third_entry in $entries)
      {
        if ($first_entry + $second_entry + $third_entry -eq $target) {
          return $first_entry * $second_entry  * $third_entry
        }
      }
    }
  }
} # Invoke-Part2

#Invoke-Part1 -Entries @(1721, 979, 366, 299, 675, 1456) -Target 2020

#Set-Location "<path of script>"
#$input = Get-Content -Path .\day-01-input.txt
#Invoke-Part1 -Entries $input -Target 2020
