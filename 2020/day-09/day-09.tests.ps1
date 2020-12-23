BeforeAll {
    . $PSCommandPath.Replace('.tests.ps1', '.ps1')

    $xmas = @(
        35,
        20,
        15,
        25,
        47,
        40,
        62,
        55,
        65,
        95,
        102,
        117,
        150,
        182,
        127,
        219,
        299,
        277,
        309,
        576
    )

    $preamble = 5
}

Describe "day-09 part-01" {
    It "Returns weak number" {
        Invoke-Part1 -xmas $xmas -preamble $preamble | Should -Be 127
    }
}