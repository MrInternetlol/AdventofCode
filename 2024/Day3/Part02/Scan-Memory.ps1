function Get-PuzzleInput {
    return $(Get-Content -Path ..\Input.txt)
}

$PuzzleInput = Get-PuzzleInput

$allMatches = (Select-String -InputObject $PuzzleInput -Pattern "(?<Multiply>mul\((?<FactorA>\d{1,3}),(?<FactorB>\d{1,3})\))|(?<Enable>do\(\))|(?<Disable>don't\(\))" -AllMatches).Matches

$Sum = 0
[bool]$State = $true
foreach ($match in $allMatches) {

    if ($match.Groups['Enable'].Success) {
        $State = $true
    }
    elseif ($match.Groups['Disable'].Success) {
        $State = $false     
    }elseif ($match.Groups['Multiply'].Success -and $State) {
        [int]$FactorA = $match.Groups['FactorA'].Value
        [int]$FactorB = $match.Groups['FactorB'].Value
        $Sum += $($FactorA * $FactorB)
    }


}

return $Sum