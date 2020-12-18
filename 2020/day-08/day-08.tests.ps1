BeforeAll {
    . $PSCommandPath.Replace('.tests.ps1', '.ps1')

    $instructions = @(
        "nop +0",
        "acc +1",
        "jmp +4",
        "acc +3",
        "jmp -3",
        "acc -99",
        "acc +1",
        "jmp -4",
        "acc +6"
    )
}

Describe "day-08 part-01" {
    It "Returns expected accumulator" {
        Invoke-Part1 -instructions $instructions | Should -Be 5
    }
}
