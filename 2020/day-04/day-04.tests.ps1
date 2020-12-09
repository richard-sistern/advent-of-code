BeforeAll {
  . $PSCommandPath.Replace('.tests.ps1', '.ps1')

    $passports = Get-Content $PSCommandPath.Replace('.tests.ps1', '-test-input.txt')
}

Describe "Part01" {
  It "Returns correct number of valid passports" {
    
    Invoke-Part1 -Passports $passports | Should -Be 7
  }
}

Describe "Part02" {
  It "Returns correct number of valid passports" {
    Invoke-Part2 -Passports $passports | Should -Be 3
  }
}


