BeforeAll {
 . $PSCommandPath.Replace('.tests.ps1', '.ps1')
}

Describe "Part 01:Check Password" {
  It "Should be True" {
    Check-Password-Part1 -Char "a" -Min 1 -Max 3 -Password "abcde" | Should -Be $true
  }
  It "Should be False" {
    Check-Password-Part1 -Char "b" -Min 1 -Max 3 -Password "cdefg" | Should -Be $false
  }
  It "Should be True" {
    Check-Password-Part1 -Char "c" -Min 2 -Max 9 -Password "ccccccccc" | Should -Be $true
  }

  It "Should be False" {
    Check-Password-Part1 -Char "z" -Min 16 -Max 18 -Password "jxsfzzjzqhzzlzzczhvz" | Should -Be $false
  }

  It "Should be False" {
    Check-Password-Part1 -Char "h" -Min 2 -Max 3 -Password "phhvhkhxhh" | Should -Be $false
  }
}

Describe "Part 01" {
  It "Should calculate correct number of passwords" {
    Invoke-Part1 -lines @("1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc") | Should -Be 2
  }

  It "Should calculate correct number of passwords" {
    Invoke-Part1 -lines @("16-18 z: jxsfzzjzqhzzlzzczhvz") | Should -Be 0
  }
}

Describe "Part 02" {
  It "Should calculate correct number of passwords" {
    Invoke-Part2 -lines @("1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc") | Should -Be 1
  }
}
