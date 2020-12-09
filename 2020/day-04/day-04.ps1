function Invoke-Part1 {
param (
  $passports
)

$passport = @{}
$count = 0

  ForEach ($line in $passports) {
    if ($line) {
      $line.Split(' ') | ForEach-Object {
        $key, $value = $_.Split(':')
        $passport.Add($key, $value)
      }
    }
    else {
      # Blank line
      If ($passport.byr -and $passport.iyr -and $passport.eyr -and $passport.hgt -and $passport.hcl -and $passport.ecl -and $passport.pid) {
        $count += 1
      }
      $passport = @{}
    }
  }

  $count
} # Invoke-Part1

  # $passports = Get-Content .\day-04-input.txt
  # Invoke-Part1 -passports $passports

function Test-Passport {
param (
  [ValidateRange(1920, 2002)]
  $byr,
  [ValidateRange(2010, 2020)]
  $iyr,
  [ValidateRange(2020, 2030)]
  $eyr,
  [ValidatePattern("^\d+(cm|in)")]
  [ValidateScript({
    $num = $_ -replace "\D"
    if ($_ -match "cm") {
      if ($num -ge 150 -and $num -le 193) { $true }
    }
    else {
      if ($num -ge 59 -and $num -le 76) { $true }
    }
    })]
    $hgt,
    [ValidatePattern("^#[\da-f]{6}$")]
    $hcl,
    [ValidateSet("amb", "blu", "brn", "gry", "grn", "hzl", "oth")]
    $ecl,
    [ValidatePattern("^\d{9}$")]
    $pid_
  )
  if (
    $byr -and
    $iyr -and
    $eyr -and
    $hgt -and
    $hcl -and
    $ecl -and
    $pid_
  ) {
    $true
  }
  } # Test-Passport

function Invoke-Part2 {
  param (
    $passports
  )

  $passport = @{}
  $count = 0

  ForEach ($line in $passports) {
    if ($line) {
      $line.Split(' ') | ForEach-Object {
        $key, $value = $_.Split(':')
        $passport.Add($key, $value)
      }
    }
    else {
      # Blank line
      try {
        if (Test-Passport -byr $passport.byr -iyr $passport.iyr -eyr $passport.eyr -hgt $passport.hgt -hcl $passport.hcl -ecl $passport.ecl -pid_ $passport.pid -ea stop) {
          $count += 1
        }
      }
      catch {  }

      $passport = @{}
    }
  }
  $count
} # Invoke-Part2

    #$passports = Get-Content $PSCommandPath.Replace('.ps1', '-input.txt')
    #Invoke-Part2 -passports $passports
