$ErrorActionPreference = "Stop"

Write-Host "Cleaning temporary files..."

Remove-Item "C:\Windows\Temp\*" `
    -Recurse `
    -Force `
    -ErrorAction SilentlyContinue

Remove-Item "C:\Temp\*" `
    -Recurse `
    -Force `
    -ErrorAction SilentlyContinue

Write-Host "Cleanup completed."
