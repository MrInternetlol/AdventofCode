function Get-PuzzleInput {
    return $(Get-Content -Path ..\Input.txt)
}

$PuzzleInput = Get-PuzzleInput

$allMatches = (Select-String -InputObject $PuzzleInput -Pattern 'mul\((?<FactorA>\d{1,3}),(?<FactorB>\d{1,3})\)' -AllMatches).Matches

$Sum = 0

foreach($match in $allMatches){
    [int]$FactorA = $match.Groups['FactorA'].Value
    [int]$FactorB = $match.Groups['FactorB'].Value
    $Sum += $($FactorA*$FactorB)
}

$Sum