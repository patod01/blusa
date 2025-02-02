@echo off
setlocal
:: Run it from project's root folder.

if not exist keys.txt (
     echo dev8080>keys.txt
)

set /p mode=< keys.txt
set port=%mode:~3%
set mode=%mode:~0,3%

if "%1"=="v" (
     vite app
) else if "%1"=="h" (
     echo Use from project\'s root folder:
     echo   srv.sh [h^|i^|v^|MODE] [PORT]
) else if "%1"=="i" (
     goto :install
) else if "%mode%"=="" (
     cd app
     ..\.venv\Scripts\python.exe slave.py dev 8080
     cd ..
) else (
     cd app
     ..\.venv\Scripts\python.exe slave.py %mode% %port%
     cd ..
)

goto ned

:install
endlocal
:: configuracion de entorno virtual
if not exist .venv\Scripts\python.exe (
     echo Installanding Piton...
     python -m venv .venv
     .venv\Scripts\activate.bat
     python -m pip install --upgrade pip
     pip install --no-cache-dir -r req.txt
     deactivate
     mkdir app\bugs
     xcopy .venv\Lib\site-packages\bottle* app\bugs /s/i/c/k
     echo.
     echo escrit de instalacion terminado!!
     pause>nul
)

:ned
