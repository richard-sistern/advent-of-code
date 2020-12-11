BeforeAll {
    . $PSCommandPath.Replace('.tests.ps1', '.ps1')
    $forms = Get-Content $PSCommandPath.Replace('.tests.ps1', '-test-input.txt') -Delimiter ([System.Environment]::NewLine * 2)
}

Describe "day-06 part-01" {
    It "Returns correct sum of yes answers" {
        Invoke-Part1 -forms $forms | Should -Be 11
    }
}

Describe "day-06 part-02" {
    It "Returns correct sum of yes answers" {
        Invoke-Part2 -forms $forms | Should -Be 6
    }
}