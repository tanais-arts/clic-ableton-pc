@echo off
setlocal
cd /d "%~dp0"

set "PYTHON=%LocalAppData%\Programs\Python\Python312\python.exe"
if not exist "%PYTHON%" (
    echo Python 3.12 introuvable. Installez-le depuis python.org ou winget.
    pause
    exit /b 1
)

if not exist ".venv\Scripts\python.exe" (
    "%PYTHON%" -m venv .venv
)

".venv\Scripts\python.exe" -m pip install -r requirements.txt
".venv\Scripts\python.exe" beat_display.py

if errorlevel 1 pause
