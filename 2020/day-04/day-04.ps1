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