@echo off
echo Killing all Python 3 processes...

taskkill /F /T /IM python3.13.exe >nul 2>&1
taskkill /F /T /IM python.exe >nul 2>&1
taskkill /F /T /IM pythonw.exe >nul 2>&1
taskkill /F /T /IM py.exe >nul 2>&1

echo Done.
pause
