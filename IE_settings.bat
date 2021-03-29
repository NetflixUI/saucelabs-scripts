rem Run as admin
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

rem Start the script to set the reg keys
@echo off
rem Set regkeys to force IE to display application/json instead of offering to download prompt
reg add "HKEY_CLASSES_ROOT\MIME\Database\Content Type\application/json" /f
reg add "HKEY_CLASSES_ROOT\MIME\Database\Content Type\application/json" /v "CLSID" /t REG_SZ /d "{25336920-03F9-11cf-8FD0-00AA00686F13}" /f
reg add "HKEY_CLASSES_ROOT\MIME\Database\Content Type\application/json" /v "Encoding" /t REG_DWORD /d 0x08000000 /f
