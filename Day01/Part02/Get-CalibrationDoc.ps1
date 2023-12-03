function Find-Number {
    param (
        $matchValue
    )

    switch ($matchValue) {
        "one" { return "1" }
        "two" { return "2" }
        "three" { return "3" }
        "four" { return "4" }
        "five" { return "5" }
        "six" { return "6" }
        "seven" { return "7" }
        "eight" { return "8" }
        "nine" { return "9" }
        Default { return $matchValue }
    }
    
}

$text = Get-Content -Path ..\input.txt
$flightCoordinates = [System.Collections.ArrayList]::new()

foreach ($line in $text) {
    $pattern = "one|two|three|four|five|six|seven|eight|nine|\d"
    $lineMatches = [System.Collections.ArrayList]::new()
    for ($x = 0; $x -lt $line.Length ; $x++){
        if($line.Substring($x) -match $pattern){
            $number = Find-Number -matchValue $matches.Values
            [void]$lineMatches.Add($number)
        }

    }
    $first = $lineMatches[0]
    $last = $lineMatches[$lineMatches.Count-1]

    [int]$intNumber = $($first + $last)

    [void]$flightCoordinates.Add($intNumber)
}
return "Sum: $(($flightCoordinates | Measure-Object -Sum).Sum)"