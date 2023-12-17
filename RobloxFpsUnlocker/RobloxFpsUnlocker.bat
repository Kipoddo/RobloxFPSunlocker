@echo off
setlocal enabledelayedexpansion

set "base_path=%userprofile%\AppData\Local\Roblox\Versions"
set "new_folder_name=ClientSettings"

rem Check if RobloxPlayerBeta.exe exists
for /f "tokens=*" %%i in ('where /r "%base_path%" RobloxPlayerBeta.exe') do (
    set "roblox_folder=%%~dpi"
    goto :create_folder
)

rem If RobloxPlayerBeta.exe doesn't exist, show a message box and exit
echo Roblox Not Found
echo Please make sure Roblox is installed in the expected directory (AppData\\Local\\Roblox).
pause
exit /b

:create_folder
set "client_settings_path=%roblox_folder%%new_folder_name%"
if not exist "%client_settings_path%\" (
    mkdir "%client_settings_path%"
    (
        echo {
        echo   "DFIntTaskSchedulerTargetFps": 999,
        echo   "FFlagReportFpsAndGfxQualityPercentiles": false,
        echo }
    ) > "%client_settings_path%\ClientAppSettings.json"
    echo Successfully unlocked FPS!
    echo Kindly be aware that in order to unlock FPS, it may be necessary to run this program every Thursday / Wednesday, as Roblox regularly updates its client.
) else (
    echo The FPS unlocker is already set up.
)

pause
exit /b