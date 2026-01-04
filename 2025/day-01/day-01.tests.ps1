BeforeAll {
 . $PSCommandPath.Replace('.tests.ps1', '.ps1')
}

Describe 'Part 01' {
  It 'Calculates the correct password' {
    Invoke-Part1 -Rotations @("L68", "L30", "R48", "L5", "R60", "L55", "L1", "L99", "R14", "L82")  | Should -Be 3
  }
}

