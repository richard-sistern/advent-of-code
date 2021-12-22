BeforeAll {
    . $PSCommandPath.Replace('.tests.ps1', '.ps1')

    [string] $initialState = "3,4,3,1,2"
}

Describe "Day 06.01a" {
    It "Fish should spawn at an exponential rate for 18 days" {
        Invoke-Part1 -seed $initialState -days 18 | Should -Be 26
    }
}

Describe "Day 06.01b" {
    It "Fish should spawn at an exponential rate for 80 days" {
        Invoke-Part1 -seed $initialState -days 80 | Should -Be 5934
    }
}