BeforeAll {
    . $PSCommandPath.Replace('.tests.ps1', '.ps1')

    $numbers = Get-Content $PSCommandPath.Replace('.tests.ps1', '-test-input.txt') -Delimiter ([System.Environment]::NewLine * 2)
    
}

Describe "Day 04.01" {
    It "Returns winning score" {
        Invoke-Part1 -numbers $numbers | Should -Be 4512
    }
}