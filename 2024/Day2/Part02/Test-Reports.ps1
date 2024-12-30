function Get-PuzzleInput {
    return $(Get-Content -Path ..\Input.txt)
}

function Test-Levels{
    param (
        [int[]]$Levels,
        [bool]$isIncreasing
    )
    
    $isSafe = $true

    for ($i = 1;$i -lt $Levels.Length;$i++)
    {
        if ($isIncreasing)
        {
            if ([int]$Levels[$i] -le [int]$Levels[$i - 1])
            {
                $isSafe = $false
                return $isSafe
            }
            elseif ([int]$Levels[$i] - [int]$Levels[$i - 1] -gt 3)
            {
                $isSafe = $false
                return $isSafe
            }
        }
        else
        {
            if ([int]$Levels[$i] -ge [int]$Levels[$i - 1])
            {
                $isSafe = $false
                return $isSafe
            }
            elseif ([int]$Levels[$i-1] - [int]$Levels[$i] -gt 3)
            {
                $isSafe = $false
                return $isSafe
            }

        }
    }
    return $isSafe
}

function Test-Reports
{
    param (
        $Reports
    )

    $ValidReports = 0

    foreach ($Report in $Reports)
    {
        [int[]]$Levels = $Report -split ' '


        if ([int]$Levels[0] -lt [int]$Levels[1])
        {
            $isIncreasing = $true
        }
        else
        {
            $isIncreasing = $false
        }

        $LevelResult = Test-Levels -Levels $Levels -isIncreasing $isIncreasing

        if ($LevelResult)
        {
            $ValidReports++
        }
        else
        {
            for ($j = 0; $j -lt $Levels.Length; $j++)
            {
                $TempLevels = $Levels[0..($j-1)] + $Levels[($j+1)..($Levels.Length-1)]
                if ($TempLevels.Length -gt 1)
                {
                    $TempResult = Test-Levels -Levels $TempLevels -isIncreasing $isIncreasing
                    if ($TempResult)
                    {
                        $ValidReports++
                        break
                    }
                }
            }
        }
    }

    return $ValidReports
}

$PuzzleInput = Get-PuzzleInput
Test-Reports -Reports $PuzzleInput