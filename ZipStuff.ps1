Write-Host "=== Start of ZipStuff ==="

Function startStuff() {
    Write-Host "Select a function:..."
    Write-Host "0 - End Program."
    Write-Host "1 - Zip a file or folder."
    Write-Host "2 - Unzip a file or folder."
    
    $MainOption = Read-Host "Select a function..."

    Switch ($MainOption){
        0 {"Ending Program..." ; Write-Host "Clearing Variables..." ; Remove-Variable * -ErrorAction SilentlyContinue ; Break}
        1 {"Entering Zip Function..." ; zipStuff ; Break}
        2 {"Entering Unzip Function..." ; unzipStuff ; Break}
        Default{"No option selected..."}
    }
}

Function zipStuff() {
    $isUpdate = Read-Host "Override an existing file? (y or n)... "
    if ($isUpdate -eq 'y'){
        $sorPath = Read-Host "Enter the source path... "
        $desPath = Read-Host "Enter the destination path... "
        Get-ChildItem -Path $sorPath | Compress-Archive -Update -DestinationPath '$desPath.zip'
    }
    else {
        $sorPath = Read-Host "Enter the source path... "
        $desPath = Read-Host "Enter the destination path... "
        Get-ChildItem -Path $sorPath | Compress-Archive -DestinationPath '$desPath.zip'
    }
    startOver
}

Function unzipStuff() {
    $LPath = Read-Host "Enter .zip path... "
    $DPath = Read-Host "Enter destination path... "
    Expand-Archive -LiteralPath $LPath -DestinationPath $DPath

    startOver
}

Function startOver() {
    $taskEnding = Read-Host "Enter 1 to start over, 2 to exit"
		if ($taskEnding -eq 1){
			startStuff
            Write-Host "Clearing Variables..."
            Remove-Variable * -ErrorAction SilentlyContinue
		} else {
			Write-Host "Clearing Variables..."
            Remove-Variable * -ErrorAction SilentlyContinue
		}
}

startStuff

Write-Host "=== End of ZipStuff ==="