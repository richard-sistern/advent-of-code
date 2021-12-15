BeforeAll {
    . $PSCommandPath.Replace('.tests.ps1', '.ps1')

    $lines = Get-Content $PSCommandPath.Replace('.tests.ps1', '-test-input.txt')
}

Describe "Day 04.01" {
    It "Returns winning score" {
        Invoke-Part1 -lines $lines | Should -Be 5
    }
}