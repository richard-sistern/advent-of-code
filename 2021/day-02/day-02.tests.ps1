BeforeAll {
    . $PSCommandPath.Replace('.tests.ps1', '.ps1')

    [string[]] $commands = @(
        "forward 5",
        "down 5",
        "forward 8",
        "up 3",
        "down 8",
        "forward 2"
    )
}

Describe "Day 02.01" {
    It "Returns final horizontal position * final depth" {
        Invoke-Part1 -commands $commands | Should -Be 150
    }
}