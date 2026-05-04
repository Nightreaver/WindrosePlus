@echo off
REM Looping wrapper — relaunches the dashboard when wp.update triggers
REM exit code 50 (in-place upgrade without bouncing the game).
where pwsh >nul 2>&1
if %ERRORLEVEL%==0 (set "PSEXE=pwsh") else (set "PSEXE=powershell")
:loop
%PSEXE% -ExecutionPolicy Bypass -File "%~dp0windrose_plus_server.ps1" %*
if %errorlevel% equ 50 (
    echo [wrapper] Dashboard requested restart, relaunching...
    goto loop
)
