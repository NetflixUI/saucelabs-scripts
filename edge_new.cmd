@echo off
echo starting prerun
echo Windows Registry Editor Version 5.00 > disablesavepw.reg
echo. >> disablesavepw.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main] >> disablesavepw.reg
echo "FormSuggest Passwords"="no" >> disablesavepw.reg
echo content of registry file to import:
type disablesavepw.reg
echo importing registry file
reg import disablesavepw.reg
echo downloading webdriver
DISM.exe /Online /Add-Capability /CapabilityName:Microsoft.WebDriver~~~~0.0.1.0

rem Run as admin
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

rem Start the script to set the reg keys
@echo off
rem Set regkeys to force autoplayback
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AutoplayAllowed" /t REG_DWORD /d 0x00000001 /f
