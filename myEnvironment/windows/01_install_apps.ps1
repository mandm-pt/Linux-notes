# Place this script on Desktop and run it
# make sure you can run ps1 scripts: Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# ==================== Install apps
winget install Microsoft.VisualStudioCode
winget install Microsoft.Skype
winget install Microsoft.PowerToys
winget install Microsoft.WindowsTerminal
winget install Mozilla.Firefox
winget install DominikReichl.KeePass
winget install 7zip.7zip
winget install SumatraPDF.SumatraPDF
winget install Git.Git
winget install VideoLAN.VLC
winget install TeamViewer.TeamViewer
winget install Telerik.FiddlerEverywhere
winget install docker
winget install Discord.Discord
winget install Valve.Steam

# ==================== remove desktop shortcuts
rm *.lnk

# ==================== Remove programs from startup
Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run -Name Discord -Value ([byte[]](0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00))
Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run -Name Steam -Value ([byte[]](0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00))

# restore ps1 run script policy: Set-ExecutionPolicy Undefined -Scope CurrentUser
