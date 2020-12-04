BeforeAll {
 . $PSCommandPath.Replace('.tests.ps1', '.ps1')
}

Describe 'Part 01' {
  It 'Calculates provided example correctly' {
    Invoke-Part1 -Entries @(1721, 979, 366, 299, 675, 1456) -Target 2020  | Should -Be 514579
  }
}

Describe 'Part 02' {
  It 'Calculates provided example correctly' {
    Invoke-Part2 -Entries @(1721, 979, 366, 299, 675, 1456) -Target 2020  | Should -Be 241861950
  }
}
