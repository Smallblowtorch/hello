@echo off
cd /d "%~dp0"

set /p MSG=Commit message (leave blank for auto): 
if "%MSG%"=="" (
    for /f "tokens=1-3 delims=/ " %%a in ("%DATE%") do set D=%%c-%%a-%%b
    for /f "tokens=1-2 delims=: " %%a in ("%TIME%") do set T=%%a:%%b
    set MSG=Update %D% %T%
)

git add .
git commit -m "%MSG%"
git push -u origin main

echo.
echo Done! Press any key to close.
pause > nul
