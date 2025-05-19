@echo off
setlocal enabledelayedexpansion

:: Step 1 - Ask for branch
set /p BRANCH=Enter branch name to push to (e.g., main, dev): 

echo.
echo Switching to branch: %BRANCH%
git checkout %BRANCH%
if errorlevel 1 (
    echo [ERROR] Failed to switch branch. Please check the name.
    pause
    exit /b
)

:: Step 2 - Add all changes
echo.
echo [+] Adding all changes...
git add .

:: Step 3 - Ask for commit message
set /p COMMIT_MSG=Enter commit message: 
echo.
git commit -m "%COMMIT_MSG%"
if errorlevel 1 (
    echo [INFO] Nothing to commit or commit failed.
    pause
    exit /b
)

:: Step 4 - Push to remote
echo.
echo [>] Pushing to remote branch: %BRANCH%
git push origin %BRANCH%
if errorlevel 1 (
    echo [ERROR] Push failed. Check connection or permissions.
    pause
    exit /b
)

echo.
echo [DONE] Push complete!
pause
