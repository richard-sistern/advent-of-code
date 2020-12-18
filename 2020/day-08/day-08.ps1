function Invoke-Part1 {
    param (
        $instructions
    )

    #$queue = New-Object System.Collections.Queue # Might be handy in part 2!
    $i = 0
    $accumulator = 0
    $queue_flag = "ON QUEUE"

    while ($i -lt $instructions.length) {
        if ($instructions[$i] -eq $queue_flag) { break }

        #$queue.Enqueue($instructions[$i])
        $instruction = $instructions[$i] -split " "

        $instructions[$i] = $queue_flag
            
        $op = $instruction[0]
        [double] $arg = $instruction[1]
            
        switch ($op) {
            'acc' { $accumulator += $arg; $i++ }
            'jmp' { $i += $arg  }
            'nop' { $i++ }
        }
    }
    $accumulator
} # Invoke-Part1

#$instructions = Get-Content $PSCommandPath.Replace('.ps1', '-input.txt') # | Select-Object -first 20
#Invoke-Part1 -instructions $instructions

