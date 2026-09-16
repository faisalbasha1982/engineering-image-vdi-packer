$ErrorActionPreference = "Stop"

Write-Host "Installing Windows updates..."

Install-Module PSWindowsUpdate `
    -Force `
    -Confirm:$false

Import-Module PSWindowsUpdate

Install-WindowsUpdate `
    -AcceptAll `
    -IgnoreReboot `
    -Verbose

Write-Host "Windows update process completed."
