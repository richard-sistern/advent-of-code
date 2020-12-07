BeforeAll {
  . $PSCommandPath.Replace('.tests.ps1', '.ps1')

  [string[]]$map =  @(
    "..##.......",
    "#...#...#..",
    ".#....#..#.",
    "..#.#...#.#",
    ".#...##..#.",
    "..#.##.....",
    ".#.#.#....#",
    ".#........#",
    "#.##...#...",
    "#...##....#",
    ".#..#...#.#"
  )
}

Describe "Part01" {
  It "Returns correct number of trees" {
    Invoke-Part1 -Map $map | Should -Be 7
  }
}

Describe "Part02" {
  It "Returns connect number of trees" {
    Check-Slope -Map $map -Right 1 -Down 1 | Should -Be 2
  }
  It "Returns connect number of trees" {
    Check-Slope -Map $map -Right 3 -Down 1 | Should -Be 7
  }
  It "Returns connect number of trees" {
    Check-Slope -Map $map -Right 5 -Down 1 | Should -Be 3
  }
  It "Returns connect number of trees" {
    Check-Slope -Map $map -Right 7 -Down 1 | Should -Be 4
  }
  It "Returns connect number of trees" {
    Check-Slope -Map $map -Right 1 -Down 2 | Should -Be 2
  }

  It "Returns correct number of trees for all slopes" {
    $slopes = @(@{right = 1; down = 1}, @{right = 3; down = 1}, @{right = 5; down = 1}, @{right = 7; down = 1}, @{right = 1; down = 2})
    Invoke-Part2 -Map $map -Slopes $slopes | Should -Be 336
  }

}
