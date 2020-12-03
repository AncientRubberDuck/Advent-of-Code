<#
    --- Day 1: Report Repair ---
    https://adventofcode.com/2020/day/1
#>

#------------- Part 2 -------------#
$PuzzleInput = Get-Content '.\input.ps1'

#region: Part 1
foreach ($a in $PuzzleInput) {

    for ($i=0; $i -lt $PuzzleInput.Count; $i++) {

        if ([int]$a + [int]$PuzzleInput[$i] -eq 2020) {
            Write-Host ([int]$a * [int]$PuzzleInput[$i])
            exit
        }
        #Write-Host $item
    }
}