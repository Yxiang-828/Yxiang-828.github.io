@echo off
title Enhanced PDF to Text Converter
echo =====================================
echo   Enhanced PDF to Text Converter
echo =====================================
echo Features:
echo - Advanced layout analysis
echo - Table extraction and formatting  
echo - Image detection and reporting
echo - Multiple extraction methods
echo - Detailed conversion reports
echo =====================================
echo.

:menu
echo What would you like to do?
echo 1. Convert a single PDF file (Enhanced)
echo 2. Convert a single PDF file (Simple/Fast)
echo 3. Convert all PDFs in a folder (Enhanced)
echo 4. Convert all PDFs in a folder (Simple/Fast)
echo 5. Exit
echo.
set /p choice="Enter your choice (1-5): "

if "%choice%"=="1" goto single_file_enhanced
if "%choice%"=="2" goto single_file_simple
if "%choice%"=="3" goto batch_convert_enhanced
if "%choice%"=="4" goto batch_convert_simple
if "%choice%"=="5" goto exit
echo Invalid choice! Please try again.
echo.
goto menu

:single_file_enhanced
echo.
set /p pdf_file="Enter PDF file path (or drag and drop): "
if not exist "%pdf_file%" (
    echo Error: File not found!
    pause
    goto menu
)
echo.
echo Converting PDF with enhanced features...
tools\.venv\Scripts\python.exe tools\pdf_converter\enhanced_pdf_converter.py "%pdf_file%"
echo.
pause
goto menu

:single_file_simple
echo.
set /p pdf_file="Enter PDF file path (or drag and drop): "
if not exist "%pdf_file%" (
    echo Error: File not found!
    pause
    goto menu
)
echo.
echo Converting PDF with simple extraction...
tools\.venv\Scripts\python.exe tools\pdf_converter\pdf_converter.py "%pdf_file%"
echo.
pause
goto menu

:batch_convert_enhanced
echo.
set /p folder_path="Enter folder path containing PDFs: "
if not exist "%folder_path%" (
    echo Error: Folder not found!
    pause
    goto menu
)
echo.
echo Converting all PDFs in folder with enhanced features...
tools\.venv\Scripts\python.exe tools\pdf_converter\enhanced_pdf_converter.py "%folder_path%" -b
echo.
pause
goto menu

:batch_convert_simple
echo.
set /p folder_path="Enter folder path containing PDFs: "
if not exist "%folder_path%" (
    echo Error: Folder not found!
    pause
    goto menu
)
echo.
echo Converting all PDFs in folder with simple extraction...
tools\.venv\Scripts\python.exe tools\pdf_converter\pdf_converter.py "%folder_path%" -b
echo.
pause
goto menu

:exit
echo Goodbye!
pause
