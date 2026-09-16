$ErrorActionPreference = "Stop"

Write-Host "Installing engineering applications..."

# MATLAB
Start-Process `
    -FilePath "C:\Installers\MATLAB\setup.exe" `
    -ArgumentList "-inputFile C:\Installers\MATLAB\silent-install.txt" `
    -Wait `
    -NoNewWindow

# ANSYS
Start-Process `
    -FilePath "C:\Installers\ANSYS\setup.exe" `
    -ArgumentList "-silent" `
    -Wait `
    -NoNewWindow

# VS Code
Start-Process `
    -FilePath "C:\Installers\VSCode\VSCodeSetup.exe" `
    -ArgumentList "/VERYSILENT /NORESTART" `
    -Wait `
    -NoNewWindow

# Python
Start-Process `
    -FilePath "C:\Installers\Python\python.exe" `
    -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" `
    -Wait `
    -NoNewWindow

Write-Host "Engineering applications installed."
