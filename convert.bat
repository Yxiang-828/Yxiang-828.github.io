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
py tools\pdf_converter\pdf_converter.py "%pdf_file%"
echo.
pause

:end
