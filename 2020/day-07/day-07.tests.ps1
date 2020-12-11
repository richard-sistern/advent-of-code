BeforeAll {
    . $PSCommandPath.Replace('.tests.ps1', '.ps1')
}

Describe "day-07" {
    It "Returns expected output" {
        day-07 | Should -Be "YOUR_EXPECTED_VALUE"
    }
}
