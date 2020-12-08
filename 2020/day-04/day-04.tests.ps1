BeforeAll {
  . $PSCommandPath.Replace('.tests.ps1', '.ps1')

  
  #$passports = Get-Content .\day-04-test-input.txt
}

$passports 
Describe "Part01" {
  It "Returns correct number of valid passports" {
    $passports = Get-Content $PSCommandPath.Replace('.tests.ps1', '-test-input.txt')
    Invoke-Part1 -Passports $passports | Should -Be 2
  }
}


