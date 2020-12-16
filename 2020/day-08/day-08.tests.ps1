BeforeAll {
    . $PSCommandPath.Replace('.tests.ps1', '.ps1')
}

Describe "day-08" {
    It "Returns expected output" {
        day-08 | Should -Be "YOUR_EXPECTED_VALUE"
    }
}
