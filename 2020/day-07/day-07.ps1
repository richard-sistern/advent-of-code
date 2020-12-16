# had to plumb the hive mind of Reddit for this one
# https://www.reddit.com/r/PowerShell/comments/k8bhj0/advent_of_code_day_7_bag_inception/

function Search-Bags {
    [cmdletbinding()]
    param (
        [hashtable]$bags,
        [string]$match_bag
    )

    if (! $stack) {
        $stack = [System.Collections.Generic.Stack[System.Collections.DictionaryEntry]]::new()
        $lvl = 0
    }
    else {
        $lvl++
    }
    
    Write-Verbose "$lvl : Looking for $match_bag"
    $parent_bags = $Bags.GetEnumerator() | Where-Object { $_.Value -contains $match_bag } 

    $parent_bags | ForEach-Object {

        $stack.Push($_)
        Search-Bags $bags -match_bag $_.Key
    }

    if ($lvl -eq 0) {
        return , $stack
    }
    
}

function Invoke-Part1 {
    [cmdletbinding()] # Add support for -Verbose
    param (
        $rules,
        $match_bag
    )

    [hashtable] $bags = @{}
    [regex] $parse_bag_string = "(?<Parent>\w+\s\w+) bags contain(( (?<Number>\d+) (?<Child>\w+ \w+) bags?,?)+|(?<Child> no other bags))\."
    
    $rules | ForEach-Object {
        $bag_matches = $parse_bag_string.Match($_)
       
        Write-Verbose $bag_matches.Groups['Parent'].Value.ToString()
        
        $bags.Add($bag_matches.Groups['Parent'].Value, $bag_matches.Groups['Child'].Captures.Value)
    }

   Write-Verbose $bags

    $results = Search-Bags $bags -match_bag $match_bag #-Verbose
    ($results | Select-Object name -Unique).count
} # Invoke-Part1

#-ReadCount 0 ???
$rules = Get-Content $PSCommandPath.Replace('.ps1', '-input.txt')  #| Select-Object -first 20
Invoke-Part1 -rules $rules -match_bag 'Shiny Gold' #-verbose






<#
TODO
    Learn more about ConvertFrom-String(data) templates

function Invoke-Part1 {
    param (
        $rules,
        $match_bag
    )

$template = @"
{parent*:striped orange} bags contain {child*:1 vibrant green} bag, {child*:5 plaid yellow} bags, {child*:1 drab magenta} bag.
{parent*:dark fuchsia} bags contain {child*:3 wavy indigo} bags, {child*:4 striped lime} bags.
{parent*:clear maroon} bags contain {child*:2 clear gold} bags, {child*:5 bright salmon} bags, {child*:5 wavy tomato} bags.
{parent*:faded tan} bags contain {child*:4 dim brown} bags.
wavy olive bags contain 3 faded gray bags, 2 posh brown bags, 3 striped cyan bags.
light plum bags contain 4 vibrant plum bags.
"@

    $bags = $rules |
        Select-Object -First 10 |
            ConvertFrom-String -TemplateContent $template -ErrorAction Stop 
    $bags | ForEach-Object {
                    Get-BagMatches -bags $bags -current_bag $_ -match_bag $match_bag

                    $_.parent.value
                    ForEach ($child in $_.parent.child.value) {
                        $t = $child -split "[0-9]\s"
                        $t[1]
                    }
                   
                    " "
                 

                }

}

#>

