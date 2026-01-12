BeforeAll {
 . $PSCommandPath.Replace('.tests.ps1', '.ps1')

 $ranges = "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,
1698522-1698528,446443-446449,38593856-38593862,565653-565659,
824824821-824824827,2121212118-2121212124".Split(',')
}

Describe 'Part 01' {
  It 'Calculate the sum of invalid IDs' {
    
    Invoke-Part1 -Ranges $ranges | Should -Be 1227775554
  }
}

Describe 'Part 02' {
  It 'Calculate the sum of invalid IDs' {
    
    Invoke-Part2 -Ranges $ranges | Should -Be 4174379265
  }
}

