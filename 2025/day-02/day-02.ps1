function Invoke-Part1 {
  [CmdletBinding()]

  param (
    [string[]] $ranges
  )

  $sum = 0

  Foreach ($range in $ranges)
  {
    $min, $max = $range -split '-' -as [int64[]]
    Write-Verbose "Processing range: $range from $min to $max"
    for ($number = $min; $number -le $max; $number++) {
      # ^     — start of the string
      # (\d+) — capture group 1: one or more digits
      # \1    — a backreference to capture group 1
      # $     — end of the string
      if ($number -match '^(\d+)\1$') {
        $sum += $number
      }
    }
  }

  return $sum
} # Invoke-Part1

$ranges = Get-Content $PSCommandPath.Replace('.ps1', '-input.txt')

Invoke-Part1 -ranges $ranges.Split(',') -Verbose