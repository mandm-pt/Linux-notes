# Place this script on Desktop and run it
# make sure you can run ps1 scripts: Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# ==================== set dark theme
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0

# ==================== remove cortana button from task bar
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowCortanaButton -Value 0
# ==================== remove task view button from task bar
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowTaskViewButton -Value 0
# ==================== show all notification icons
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name EnableAutoTray -Value 0
# ==================== show file extensions
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -Value 0
# ==================== Open file exporer in This PC instead of quick access
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1

# ==================== set Edge to use system theme
$LocalAppData = [Environment]::GetFolderPath( [Environment+SpecialFolder]::LocalApplicationData )
$edgeDefaults = Join-Path $LocalAppData "Microsoft\Edge\User Data\Default"
$edgePrefFile = Join-Path $edgeDefaults "Preferences"
$Settings = Get-Content $edgePrefFile | ConvertFrom-Json

$Settings.extensions.theme.use_system = 'True'

$Settings | ConvertTo-Json -depth 64| set-content $edgePrefFile

# ====================

# restore ps1 run script policy: Set-ExecutionPolicy Undefined -Scope CurrentUser