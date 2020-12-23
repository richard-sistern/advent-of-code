function Invoke-Part1 {
    param (
        [int64[]]
        $xmas,
        [int]
        $preamble
    )

    $i = $preamble
    While ($i -lt $xmas.Count) {

        [int] $target = $xmas[$i]

        $match_flag = $false
        
        For ( $left = ($i - $preamble); $left -lt $i; $left++ ) {
            For ( $right = ($i - $preamble); $right -lt $i; $right++ ) {
                # Ignore itself...
                if ($xmas[$left] -ne $xmas[$right]) {
                    if ( $target -eq ($xmas[$left] + $xmas[$right]) ) {
                        $match_flag = $true
                    }
                }
            } # For $right
        } # For $left

        if ($match_flag -eq $false) {
           # No match found, we have a winner
            return $target
        }

        $i++ # Move along...
    }
}

#$xmas = Get-Content $PSCommandPath.Replace('.ps1', '-input.txt')
#$preamble = 25

#Invoke-Part1 -xmas $xmas -preamble $preamble

# TODO: Part 2