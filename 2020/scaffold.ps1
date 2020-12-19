function aoc_scaffold {
    param(
        $day
    )

    $day = "day-{0:D2}" -f $day
    $path = "$($PSCommandPath.Replace('scaffold.ps1', ''))$day"
    
   # $day

    $path
    If (Test-Path $path -PathType Container) {
        "$day already exists, wonder how you answered it..."
    }
    else {
        
        New-Item -ItemType Directory $path
        New-Item -ItemType File "$path\README.txt"
        New-Item -ItemType File "$path\$day-input.txt"
        New-Item -ItemType File "$path\$day.ps1"
        New-Item -ItemType File "$path\$day.tests.ps1"
    }
    #throw [NotImplementedException]'aoc_scaffold is not implemented.'
}

01..24 | ForEach-Object { aoc_scaffold $_ }
