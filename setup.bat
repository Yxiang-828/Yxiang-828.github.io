@echo off
title PDF Converter Setup
echo =====================================
echo     PDF Converter Setup
echo =====================================
echo.
echo This will set up the PDF converter on your computer.
echo.

REM Check if Python is installed
py --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH!
    echo Please install Python from https://python.org
    echo Make sure to check "Add Python to PATH" during installation
    pause
    exit /b 1
)

echo Python found. Setting up virtual environment...
echo.

REM Create virtual environment
if not exist "tools\.venv" (
    echo Creating virtual environment...
    py -m venv tools\.venv
    if errorlevel 1 (
        echo ERROR: Failed to create virtual environment!
        pause
        exit /b 1
    )
    echo Virtual environment created successfully.
) else (
    echo Virtual environment already exists.
)

echo.
echo Installing essential packages...
tools\.venv\Scripts\python.exe -m pip install --upgrade pip
tools\.venv\Scripts\python.exe -m pip install -r tools\pdf_converter\requirements.txt

if errorlevel 1 (
    echo WARNING: Some packages failed to install.
    echo The basic PDF converter should still work with core packages.
    echo.
    echo Installing core packages only...
    tools\.venv\Scripts\python.exe -m pip install pdfplumber==0.10.3 PyPDF2==3.0.1 Pillow pandas numpy
    
    if errorlevel 1 (
        echo ERROR: Failed to install core packages!
        echo Please check your internet connection and try again.
        pause
        exit /b 1
    )
    
    echo.
    echo =====================================
    echo     Basic Setup Complete!
    echo =====================================
    echo Core PDF processing is ready.
    echo For advanced features, you may need to install additional packages manually.
    echo.
    pause
    exit /b 0
)

echo.
echo =====================================
echo     Setup Complete!
echo =====================================
echo You can now use convert.bat to convert PDF files.
echo.
pause
