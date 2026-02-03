@echo off
setlocal EnableDelayedExpansion
set "ROOT_DIR=%~dp0"
cd /d "%ROOT_DIR%"

:: 1. Admin Check
net session >nul 2>&1
if %errorlevel% neq 0 (echo PLEASE RUN AS ADMIN & pause & exit /b)

echo [1/3] Installing Environment...
python -m pip install pygame pygetwindow pyrect 
python -m pip install pygame pywin32 

echo [2/3] Generating Game Engine (Distorty.py)...
:: The ^ characters before the colons and parentheses are "escapes" 
:: that tell Batch: "Don't run this, just write it to the file."
(
echo import pygame, random, subprocess, sys, os, pygetwindow as gw
echo # Minimize Logic
echo for win in gw.getAllWindows^(^)^:
echo     if win.title != "" and "Trippy Bird" not in win.title^:
echo         try^:
echo             win.minimize^(^)
echo         except^:
echo             pass
echo # Universal Paths
echo BASE_DIR = os.path.dirname^(os.path.abspath^(__file__^)^)
echo YA_PATH = os.path.join^(BASE_DIR, "ya.py"^)
echo # Game Logic
echo pygame.init^(^)
echo screen = pygame.display.set_mode^(^(800, 600^)^)
echo pygame.display.set_caption^("Trippy Bird"^)
echo clock = pygame.time.Clock^(^)
echo running = True
echo while running^:
echo     for event in pygame.event.get^(^)^:
echo         if event.type == pygame.QUIT^: running = False
echo     screen.fill^(^(random.randint^(0, 255^), random.randint^(0, 255^), random.randint^(0, 255^)^)^)
echo     pygame.display.flip^(^)
echo     clock.tick^(60^)
echo pygame.quit^(^)
) > Distorty.py

echo [3/3] Generating Popup Logic (ya.py)...
(
echo import os, sys
echo BASE = os.path.dirname^(os.path.abspath^(__file__^)^)
echo audio_path = os.path.join^(BASE, "idiot.mp3"^)
echo print^(f"Audio active from^: {audio_path}"^)
) > ya.py

echo.
echo =========================================
echo        FIXED PURE SETUP COMPLETE
echo =========================================
echo 1. Syntax colons ^(:^) repaired
echo 2. Paths: UNIVERSAL
echo 3. Mode: MINIMIZE ALL ACTIVE
echo =========================================
pause