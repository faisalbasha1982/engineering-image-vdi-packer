$ErrorActionPreference = "Stop"

Write-Host "Applying Windows security configuration..."

# Enable Windows Firewall
Set-NetFirewallProfile `
    -Profile Domain,Public,Private `
    -Enabled True

# Disable SMBv1
Disable-WindowsOptionalFeature `
    -Online `
    -FeatureName SMB1Protocol `
    -NoRestart

# Disable guest account
Disable-LocalUser -Name "Guest"

# Enable Defender
Set-MpPreference -DisableRealtimeMonitoring $false

Write-Host "Security configuration completed."
