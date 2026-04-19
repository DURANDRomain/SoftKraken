@echo off
start ms-settings:nightlight

REM If waiting is necessary, simply uncomment the line below (remove 'REM').
timeout /t 1 /nobreak >nul

REM Check if Night Light is enabled
powershell -command "$nlStatus = Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount*windows.data.bluelightreduction.bluelightreductionstate*' | Select-String -Pattern '"Data":[1]'; if ($nlStatus) { exit 1 } else { exit 0 }"
if %errorlevel%==1 (
REM Night Light is ON, needs Shift+Tab before Enter
powershell -command "$wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('+{TAB}')"
timeout /t 1 /nobreak >nul
)

REM Press Enter to toggle Night Light
powershell -command "$wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('{ENTER}')"

REM If waiting is necessary, simply uncomment the line below (remove 'REM').
rem timeout /t 2 /nobreak >nul

REM Close the Settings window
rem powershell -command "Get-Process | Where-Object { $.MainWindowTitle -like 'Settings' } | ForEach-Object { $.CloseMainWindow() }"
taskkill /F /IM SystemSettings.exe