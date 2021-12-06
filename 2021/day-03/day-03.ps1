# Shamelessly stolen from https://github.com/indented-automation/AoC/blob/master/2021/03/Part1.ps1
# Really struggled to get my head around this on so found one done well and tried to understand it.

function Invoke-Part1 {
    [CmdletBinding()]
    
    param (
        [string[]]$diagnostics
    )
    
    $gamma = $epsilon = 0
    
    $length = $diagnostics[0].Length # Input length is uniform
    
    # For each char in diagnostic string...
    for ($i = 0; $i -lt $length; $i++) {

        # Math.Pow(number to be raised to a power, number that specifies a power)
        $v = [Math]::Pow(2, $length - $i - 1)

        Write-Verbose "i = $i"
        Write-Verbose "v = $v"


        $group = $diagnostics | 
            ForEach-Object { 
                Write-Verbose "obj $_"
                Write-Verbose "obj[i] =  $($_[$i])"
                $_[$i] 
            } | 
                Group-Object | 
                    Sort-Object Count

        Write-Verbose "group[0] = $($group[0].name)"
        Write-Verbose "group[1] = $($group[1].name)"

        # Bitwise OR (-bor)
        # In a Bitwise OR (inclusive) operation, the resulting bit is set to 1 when either or bit input bits are 1.
        # The resulting bit is only set to 0 when both input bits are 0.  For example:
        # 1010      (10)
        # 0011      ( 3)
        # --------------  bOR (inclusive)
        # 1011      (11)

        $gamma = $gamma -bor $v * $group[1].Name
        $epsilon = $epsilon -bor $v * $group[0].Name

        Write-Verbose "gamma = $gamma"
        Write-Verbose "epsilon = $epsilon"
        Write-Verbose "................"
    }
    $gamma * $epsilon 
} # Invoke-Part1

$diagnostics = Get-Content $PSCommandPath.Replace('.ps1', '-input.txt')
Invoke-Part1 -diagnostics $diagnostics #-verbose