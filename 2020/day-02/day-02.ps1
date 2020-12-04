function Check-Password-Part1 {
  param (
    [string] $char,
    [int] $min,
    [int] $max,
    [string] $password
  )

  [int] $count = [regex]::matches($password,$char).count
  if ($count -ge $min -and $count -le $max) {
    $true
  }
  else {
    $false
  }
} # Check-Password

function Invoke-Part1 {
  param (
    [string[]] $lines
  )

  [int] $count = 0
  Foreach ($line in $lines)
  {
    $line = $line.split(' ')

    [int] $min = $line[0].split('-')[0]
    [int] $max = $line[0].split('-')[1]
    [string] $char = $line[1] -replace ':',''
    [string] $password = $line[2]

    if (Check-Password-Part1 -Char $char -Min $min -Max $max -Password $password) {
      $count += 1
    }
  }

  $count
} # Invoke-Part1

#Invoke-Part1 -lines @('1-3 a: abcde')
#Set-Location "<path of script>"
#$input = Get-Content -Path .\day-02-input.txt
#Invoke-Part1 -Lines $input

function Invoke-Part2 {
  param (
    [string[]] $lines
  )

  [int] $count = 0
  Foreach ($line in $lines) {
    [string[]] $line = $line.split(' ')
    [int] $position_one = $line[0].split('-')[0]
    [int] $position_two = $line[0].split('-')[1]
    [string] $char = $line[1] -replace ':',''
    [string] $password = $line[2]

    if ($password[$position_one-1] -eq $char -xor $password[$position_two-1] -eq $char) {
      $count += 1
     }
  }

  $count
} # Invoke-Part2

#Invoke-Part2 -lines @('1-3 a: abcde')
#Set-Location "<path of script>"
#$input = Get-Content -Path .\day-02-input.txt
#Invoke-Part2 -Lines $input
