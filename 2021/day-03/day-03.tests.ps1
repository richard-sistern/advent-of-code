BeforeAll {
    . $PSCommandPath.Replace('.tests.ps1', '.ps1')

    [string[]] $diagnostics = @(
        "00100",
        "11110",
        "10110",
        "10111",
        "10101",
        "01111",
        "00111",
        "11100",
        "10000",
        "11001",
        "00010",
        "01010"
    )
}

Describe "Day 03.01" {
    It "Returns gamma rate multiplied by epsilon rate" {
        Invoke-Part1 -diagnostics $diagnostics -verbose | Should -Be 198
    }
}