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

REM Install Tesseract OCR for image text extraction
echo.
echo Installing Tesseract OCR for advanced text extraction...
echo Checking if Chocolatey is available...
choco --version >nul 2>&1
if errorlevel 1 (
    echo Chocolatey not found. Skipping Tesseract installation.
    echo To install Tesseract manually:
    echo 1. Download from: https://github.com/UB-Mannheim/tesseract/wiki
    echo 2. Install and add to PATH
    echo 3. Or install Chocolatey first: https://chocolatey.org/install
) else (
    echo Installing Tesseract via Chocolatey...
    echo NOTE: This requires Administrator privileges.
    choco install tesseract -y --force
    if errorlevel 1 (
        echo WARNING: Tesseract installation failed.
        echo This is likely because Administrator privileges are required.
        echo.
        echo To install Tesseract:
        echo 1. Open PowerShell as Administrator
        echo 2. Run: choco install tesseract -y --force
        echo 3. Restart terminal after installation
        echo.
        echo PDF converter will work without OCR features for now.
        goto :skip_tesseract
    ) else (
        echo Tesseract installed successfully!
        echo.
        echo IMPORTANT NOTES ABOUT OCR:
        echo - OCR works best with high-quality text images
        echo - Mathematical notation and diagrams may have poor OCR quality
        echo - Low-resolution PDF images will produce garbled text
        echo - You may need to restart your terminal to access tesseract command
        echo - Virtual environments may need PATH refresh
        echo.
        echo To test OCR: tesseract --version
        goto :skip_tesseract
    )
)

:skip_tesseract

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
