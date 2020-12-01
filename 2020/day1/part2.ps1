# Ref: https://adventofcode.com/2020/day/1

$PuzzleInput = Get-Content '.\input.ps1'

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