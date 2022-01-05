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
reg add "HKEY_LOCAL_MACHINE\SOFTWARE/Policies/Microsoft/Edge" /v "AutoplayAllowed" /t REG_DWORD /d 0x00000001 /f
