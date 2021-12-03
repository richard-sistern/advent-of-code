BeforeAll {
    . $PSCommandPath.Replace('.tests.ps1', '.ps1')

    [string[]] $depths = @(
        "199",
        "200",
        "208",
        "210",
        "200",
        "207",
        "240",
        "269",
        "260",
        "263"
    )
}

Describe "Day 01.01" {
    It "Returns number of depth increases" {
        Invoke-Part1 -depths $depths | Should -Be 7
    }
}