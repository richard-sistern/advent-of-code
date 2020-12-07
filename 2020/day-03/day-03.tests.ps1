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
