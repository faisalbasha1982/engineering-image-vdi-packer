$ErrorActionPreference = "Stop"

$licenseServer = "27000@license01.company.local"

Write-Host "Configuring FlexNet..."

# Machine-level environment variable
[Environment]::SetEnvironmentVariable(
    "LM_LICENSE_FILE",
    $licenseServer,
    "Machine"
)

# Example application-specific configuration
$flexnetDir = "C:\ProgramData\FlexNet"

if (!(Test-Path $flexnetDir)) {
    New-Item -ItemType Directory -Path $flexnetDir | Out-Null
}

@"
SERVER license01.company.local ANY 27000
USE_SERVER
"@ | Set-Content "$flexnetDir\license.conf"

Write-Host "FlexNet configured."
