BeforeAll {
    . $PSCommandPath.Replace('.tests.ps1', '.ps1')

    <#
        BFFFBBFRRR: row 70, column 7, seat ID 567.
        FFFBBBFRRR: row 14, column 7, seat ID 119.
        BBFFBBFRLL: row 102, column 4, seat ID 820.
    #>
    [string[]] $cards = @(
        "BFFFBBFRRR",
        "FFFBBBFRRR",
        "BBFFBBFRLL"
    )
}

Describe "day-05 part-01" {
    It "Returns highest seat ID" {
        Invoke-Part1 -cards $cards | Should -Be 820
    }
}

Describe "day-05 part-01" {
    It "Returns missing seat ID" {
        Invoke-Part2 -cards $cards | Should -HaveCount 699
    }
}
