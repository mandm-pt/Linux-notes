# Place this script on Desktop and run it
# make sure you can run ps1 scripts: Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

DISM /Online /enable-feature /All /featurename:Microsoft-Hyper-V /norestart

# for WSL
DISM /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
DISM /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

DISM /online /disable-feature /featurename:WindowsMediaPlayer /norestart
DISM /online /disable-feature /featurename:Printing-Foundation-InternetPrinting-Client /norestart
DISM /online /disable-feature /featurename:Printing-Foundation-InternetPrinting-Client /norestart
DISM /online /disable-feature /featurename:Printing-XPSServices-Features /norestart
DISM /online /disable-feature /featurename:SMB1Protocol /norestart
DISM /online /disable-feature /featurename:WorkFolders-Client /norestart

# IE11
DISM /online /disable-feature /featurename:Internet-Explorer-Optional-amd64 /norestart

# restore ps1 run script policy: Set-ExecutionPolicy Undefined -Scope CurrentUser
