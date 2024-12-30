function Get-PuzzleInput {
    return $(Get-Content -Path ..\Input.txt)
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
        $isSafe = $true

        if ([int]$Levels[0] -lt [int]$Levels[1])
        {
            $isIncreasing = $true
        }
        else
        {
            $isIncreasing = $false
        }

        for ($i = 0;$i -lt $Levels.Length;$i++)
        {
            if ($i -eq 0)
            {
                Continue
            }
            if ($isIncreasing)
            {
                if ([int]$Levels[$i] -le [int]$Levels[$i - 1])
                {
                    $isSafe = $false
                    break
                }
                elseif ([int]$Levels[$i] - [int]$Levels[$i - 1] -gt 3)
                {
                    $isSafe = $false
                    break
                }
            }
            else
            {
                if ([int]$Levels[$i] -ge [int]$Levels[$i - 1])
                {
                    $isSafe = $false
                    break
                }
                elseif ([int]$Levels[$i-1] - [int]$Levels[$i] -gt 3)
                {
                    $isSafe = $false
                    break
                }

            }
        }

        if ($isSafe)
        {
            $ValidReports++
        }
    }

    return $ValidReports
}

$PuzzleInput = Get-PuzzleInput
Test-Reports -Reports $PuzzleInput