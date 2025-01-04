function Get-PuzzleInput {
    return $(Get-Content -Path ..\Input.txt)
}

$PuzzleInput = Get-PuzzleInput