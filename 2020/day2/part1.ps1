<#
    --- Day 2: Password Philosophy ---
    ------------- Part 1 -------------
    
    https://adventofcode.com/2020/day/2
#>

$PuzzleInput = Get-Content '.\input.txt'
$i = 0

foreach ($line in $PuzzleInput) {

    $inputString = ([regex]::Matches($line,'([a-zA-Z]*)$')).Value
    
    $PasswordPolicy_Count = ([regex]::matches($line, '^\d*-\d*')).Value
    $PasswordPolicy_Char = (([regex]::matches($line,'[a-zA-Z]:')).Value).Replace(':','')
    $PasswordPolicy_CountMin = $PasswordPolicy_Count.Split('-')[0]
    $PasswordPolicy_CountMax = $PasswordPolicy_Count.Split('-')[1]

    $CharMatches = ([regex]::Matches($inputString, $PasswordPolicy_Char)).count

    if ( $CharMatches -ge $PasswordPolicy_CountMin -and $CharMatches -le $PasswordPolicy_CountMax ) {
        $i++
    }
}

return $i