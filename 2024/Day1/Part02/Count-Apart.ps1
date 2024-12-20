function Get-PuzzleInput {
    return $(Get-Content -Path ..\Input.txt)
}

$Left = New-Object -TypeName System.Collections.ArrayList
$Right = New-Object -TypeName System.Collections.ArrayList

$Data = Get-PuzzleInput

foreach($Line in $Data){
    $Parts = $Line -split "\s{3}"
    $Left.Add($Parts[0]) | Out-Null
    $Right.Add($Parts[1]) | Out-Null
}

$Left.Sort()
$Right.Sort()

$GroupedRight = $Right | Group-Object

[int]$Sum = 0

for($I = 0; $I -le $Left.count-1; $I++) {

    $result = $GroupedRight | Where-Object{$_.Name -like $Left[$I]}
    $sumToAdd = $result.Count * $Left[$I]
    $Sum += $sumToAdd    
}

return $Sum