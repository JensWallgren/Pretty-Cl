
function Write-StyledOutput {
    param(
        $InputObject,
        $Foreground,
        $Background,
        $SGR
    )

    $ForegroundEscapeCode = ''
    $BackgroundEscapeCode = ''
    $SGREscapeCode = ''

    if ($Foreground -ne $null) {
        $ForegroundEscapeCode = "`e[38;5;$($Foreground)m"
    }
    if ($Background -ne $null) {
        $BackgroundEscapeCode = "`e[48;5;$($Background)m"
    }
    if ($SGR -ne $null) {
        $SGREscapeCode = "`e[$($SGR)m"
    }

    $Output = $ForegroundEscapeCode + $BackgroundEscapeCode + $SGREscapeCode + $InputObject + "`e[m"

    Write-Output $Output
}


function Pretty-Cl {

    # Time and run msvc
    $msvc_time = [System.Diagnostics.Stopwatch]::StartNew()

    $cl_output = Invoke-Expression "cl.exe $args" 2>&1

    $msvc_time.Stop()
    $cl_success = $lastexitcode


    $OutputLength ??= $cl_output.count
    $cl_output | Select-Object -First $OutputLength | ForEach-Object {

        # Basic regex that should match paths:
        # E.g. "C:\Path\To\file.h(210)
        #      "../file.h(210)
        $PathRegex = '(\w:)?[\w\\\/. \(\)]+\([0-9]+\)'

        if ($_ -match "^$PathRegex ?: (fatal )?error") {
            Write-StyledOutput " `u{274c}  $_" -Foreground 203
        }
        elseif ($_ -match "^$PathRegex ?: warning") {
            Write-StyledOutput " `u{1f514}  $_" -Foreground 11 
        }
        elseif ($_ -match "^$PathRegex ?: note") {
            Write-StyledOutput "     $_" -Foreground 245
        }
        else {
            Write-Host $_
        }
    }


    Write-Host "`n  " -NoNewline
    if ($cl_success -eq 0) {
        Write-StyledOutput " Compilation success -- Compile time: $($msvc_time.Elapsed) " -Background 40 -Foreground 15
    }
    else {
        Write-StyledOutput " Compilation failed -- Compile timer: $($msvc_time.Elapsed) " -Background 1 -Foreground 15
    }
    Write-Host ''
}


