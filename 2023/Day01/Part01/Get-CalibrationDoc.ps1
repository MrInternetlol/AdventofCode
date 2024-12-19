$text = Get-Content -Path ..\input.txt

$flightCoordinates = [System.Collections.ArrayList]::new()
foreach($line in $text){
    $myMatch = Select-String -inputObject $line -Pattern "\d" -AllMatches
    $first = $myMatch.Matches[0].Value
    $last = $myMatch.Matches[$($myMatch.Matches.Length - 1)].Value

    $number = $first + $last
    $intNumber = [int]$number
    [void]$flightCoordinates.Add($intNumber)
}
Write-Host "Sum: $(($flightCoordinates | Measure-Object -Sum).Sum)"