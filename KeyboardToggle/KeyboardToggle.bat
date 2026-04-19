pause 
echo Toggle keyboard devices
echo Set your devices ID path in the PNPUTIL lines
echo This script needs to be run as an administrator
echo SoftKraken - Romain D. / 04-16-26 Hopital Lozere
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
@echo off
REG QUERY HKLM\Software\SoftKraken\KeyboardToggle /v KeyboardIsEnabled | find "true"
if %errorlevel% == 0 (
    echo Keyboard Is Enabled
    reg add HKLM\Software\SoftKraken\KeyboardToggle /t REG_SZ /v KeyboardIsEnabled /d false /f
    PNPUTIL /remove-device "ACPI\IDEA0100\4&1E6245DF&0"
    PNPUTIL /remove-device "HID\VID_048D&PID_C102&COL02\6&FA5AE31&0&0001"
    PNPUTIL /remove-device "HID\VID_048D&PID_C975&MI_00&COL04\7&233E58F9&0&0003"
    PNPUTIL /remove-device "HID\VID_1532&PID_0084&MI_02\8&2B07266B&0&0000"
    reg add HKLM\Software\SoftKraken\KeyboardToggle /t REG_SZ /v KeyboardIsEnabled /d false /f
) else (
    echo Keyboard Is Disabled
    reg add HKLM\Software\SoftKraken\KeyboardToggle /t REG_SZ /v KeyboardIsEnabled /d true /f
    PNPUTIL /scan-devices
    reg add HKLM\Software\SoftKraken\KeyboardToggle /t REG_SZ /v KeyboardIsEnabled /d true /f
)