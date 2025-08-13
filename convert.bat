@echo off
title Professional PDF to Markdown Converter
echo ========================================
echo   Professional PDF to Markdown Converter
echo ========================================
echo.

set /p pdf_file="Enter PDF file path (or drag and drop): "
if not exist "%pdf_file%" (
    echo Error: File not found!
    pause
    goto end
)
echo.
echo Converting PDF with professional-grade processing...
echo This may take a moment for large PDFs...
echo.
tools\.venv\Scripts\python.exe tools\pdf_converter\pdf_converter.py "%pdf_file%"
echo.
pause

:end
