@echo off
echo Pulling latest changes from origin/main...
git pull origin main

echo Adding all modified files...
git add .

echo Committing with temporary message: "autosave"
git commit -m "autosave"

echo Pushing to origin/main...
git push origin main

echo.
echo ✅ Autosave complete.
pause
