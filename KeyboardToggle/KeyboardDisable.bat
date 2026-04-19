if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
PNPUTIL /remove-device "ACPI\IDEA0100\4&1E6245DF&0"
PNPUTIL /remove-device "HID\VID_048D&PID_C102&COL02\6&FA5AE31&0&0001"
PNPUTIL /remove-device "HID\VID_048D&PID_C975&MI_00&COL04\7&233E58F9&0&0003"
PNPUTIL /remove-device "HID\VID_1532&PID_0084&MI_02\8&2B07266B&0&0000"
