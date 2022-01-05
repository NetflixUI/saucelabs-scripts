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
echo enabling autoPlay
echo [HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main]
"MediaAutoPlayOption"=dword:00000000
