<#
    --- Day 2: Password Philosophy ---    
    https://adventofcode.com/2020/day/2
#>

$PuzzleInput = Get-Content '.\input.txt'

#------------- Part 1 -------------#
#region: Part 1
#----- Method 1 -----#
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

#----- Method 2 -----#
# Using Array Deconstruct
$i = 0

$PuzzleInput | Where-Object { 
    # Deconstruct the array
    $Min,$Max,$char,$string = $_ -split'\W+'

    $Match = ([regex]::Matches($string, $char)).count

    if ( $Match -ge $Min -and $Match -le $Max ) {
        $i++
    }
}

return $i
      
#endregion: Part 1

#------------- Part 2 -------------#
#region: Part 2
#----- Method 1 -----#
$i = 0

foreach ($line in $PuzzleInput) {

    $inputString = ([regex]::Matches($line,'([a-zA-Z]*)$')).Value
    
    $PasswordPolicy_Positions = ([regex]::matches($line, '^\d*-\d*')).Value
    $PasswordPolicy_Char = (([regex]::matches($line,'[a-zA-Z]:')).Value).Replace(':','')
    [int]$PasswordPolicy_PositionOne = [int]$PasswordPolicy_Positions.Split('-')[0] - 1
    [int]$PasswordPolicy_PositionTwo = [int]$PasswordPolicy_Positions.Split('-')[1] - 1

    $matchs = 0

    if (($inputString[0])[$PasswordPolicy_PositionOne] -eq $PasswordPolicy_Char) {
        $matchs++
    }

    if (($inputString[0])[$PasswordPolicy_PositionTwo] -eq $PasswordPolicy_Char) {
        $matchs++
    }

    if ($matchs -eq 1) {
        $i++
    }
}

return $i

#----- Method 2 -----#
$i = 0

($PuzzleInput | Where-Object { 
    # Deconstruct the array
    $Min,$Max,$char,$string = $_ -split'\W+'

    # Add a space to start array on 1
    -join(" $string"[$Min,$Max] -eq $char ) -eq $char
}).count

#endregion: Part2