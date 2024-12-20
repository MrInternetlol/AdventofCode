function Get-PuzzleInput {
    return $(Get-Content -Path ..\Input.txt)
}

$left = New-Object -TypeName System.Collections.ArrayList
$right = New-Object -TypeName System.Collections.ArrayList

$input = Get-PuzzleInput

foreach($line in $input){
    $parts = $line -split "\s{3}"
    $left.Add($parts[0]) | Out-Null
    $right.Add($parts[1]) | Out-Null
}

$left.Sort()
$right.Sort()

[int]$sum = 0

for ($i = 0; $i -le $left.count-1; $i++) {

    $SumApart = [Math]::Abs($left[$i]-$right[$i])

    $sum = $sum + $SumApart

}

return $sum