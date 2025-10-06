@echo off
echo Downloading Vencord Installer...
curl -L -o VencordInstallerCli.exe https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli.exe
if not exist VencordInstallerCli.exe (
    echo Download failed. Please check your internet or download manually from https://vencord.dev/download/
    pause
    exit /b 1
)
echo Running Vencord Installer...
VencordInstallerCli.exe
echo Cleaning up...
del VencordInstallerCli.exe
echo Done! Restart Discord PTB to see Vencord.