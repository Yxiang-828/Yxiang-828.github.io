@echo off
title Simple PDF to Markdown Converter
echo ========================================
echo   Simple PDF to Markdown Converter
echo ========================================
echo.

set /p pdf_file="Enter PDF file path (or drag and drop): "
if not exist "%pdf_file%" (
    echo Error: File not found!
    pause
    goto end
)

echo.
echo Converting PDF with clean text extraction...
echo This should be fast and accurate...
echo.

REM Check if virtual environment exists and use it
if exist "tools\.venv\Scripts\python.exe" (
    echo Using virtual environment...
    tools\.venv\Scripts\python.exe tools\pdf_converter\pdf_converter.py "%pdf_file%"
) else (
    echo Virtual environment not found. Checking global Python installation...
    REM Check if pymupdf is installed, if not install it
    py -c "import pymupdf" 2>nul
    if %errorlevel% neq 0 (
        echo Installing required dependency: pymupdf...
        py -m pip install pymupdf
        if %errorlevel% neq 0 (
            echo Error: Failed to install pymupdf. Please run setup.bat first.
            pause
            goto end
        )
    )
    echo Running PDF converter with global Python...
    py tools\pdf_converter\pdf_converter.py "%pdf_file%"
)

if %errorlevel% neq 0 (
    echo.
    echo Conversion failed. Please check the error messages above.
)

echo.
pause

:end
