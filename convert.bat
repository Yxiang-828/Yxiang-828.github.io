@echo off
title PDF to Markdown Converter
echo =====================================
echo     PDF to Markdown Converter
echo =====================================
echo.

set /p pdf_file="Enter PDF file path (or drag and drop): "
if not exist "%pdf_file%" (
    echo Error: File not found!
    pause
    goto end
)
echo.
echo Converting PDF to Markdown...
tools\.venv\Scripts\python.exe tools\pdf_converter\pdf_converter.py "%pdf_file%"
echo.
pause

:end
