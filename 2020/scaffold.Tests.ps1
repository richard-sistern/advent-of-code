BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "aoc_scaffold" {
    It "Returns expected output" {
        aoc_scaffold | Should -Be "YOUR_EXPECTED_VALUE"
    }
}
