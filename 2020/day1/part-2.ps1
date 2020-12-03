<#
    --- Day 1: Report Repair ---
    https://adventofcode.com/2020/day/1
#>

#------------- Part 2 -------------#
foreach ($a in $PuzzleInput) {

    for ($i=0; $i -lt $PuzzleInput.Count; $i++) {

        for ($ii=0; $ii -lt $PuzzleInput.Count; $ii++) {

            if ([int]$a + [int]$PuzzleInput[$i] +[int]$PuzzleInput[$ii] -eq 2020) {
                Write-Host ([int]$a * [int]$PuzzleInput[$i] * [int]$PuzzleInput[$ii] )
                exit
            }
        }
    }
}