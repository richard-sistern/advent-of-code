BeforeAll {
    . $PSCommandPath.Replace('.tests.ps1', '.ps1')
}

Describe "day-06" {
    It "Returns expected output" {
        day-06 | Should -Be "YOUR_EXPECTED_VALUE"
    }
}
