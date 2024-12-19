$Content = Get-Content -Path ..\input.txt
$red = 12
$green = 13
$blue = 14
$gamesSum = New-Object System.Collections.ArrayList
foreach ($Game in $Content) {
    $Game -match "(?<=Game )(?<GameId>\d+): (?<Rounds>.*)" | Out-Null
    
    $GameId = $Matches.GameId
    $Rounds = $Matches.Rounds -split '; '
    
    $addGameToSum = $true

    foreach ($Round in $Rounds) {
        $Cubes = $Round -split ", "
        ## Das ist ein Array von Strings, z.B.:
        ## $Cubes = "1 red", "2 green", "3 blue"

        foreach ($Cube in $Cubes) {
            $Cube -match "(?<NumberOfCubes>\d+) (?<ColorOfCubes>.*)" | Out-Null
            $NumberOfCubes = [int]$Matches.NumberOfCubes
            $ColorOfCubes = $Matches.ColorOfCubes

            switch ($ColorOfCubes) {
                "red" { if ($NumberOfCubes -gt $red) { $addGameToSum = $false } }
                "green" { if ($NumberOfCubes -gt $green) { $addGameToSum = $false } }
                "blue" { if ($NumberOfCubes -gt $blue) { $addGameToSum = $false } }
            }
        }
    }
    
    if ($addGameToSum) {
        $gamesSum.Add($GameId) | Out-Null
    }
}

return ($gamesSum | Measure-Object -Sum).Sum