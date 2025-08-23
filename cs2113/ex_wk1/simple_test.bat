@echo off
echo Compiling Java files...
javac ex.java SimpleTest.java

if %errorlevel% neq 0 (
    echo Compilation failed!
    pause
    exit /b 1
)

echo.
echo Running tests...
echo.
java SimpleTest

echo.
echo Test completed. Press any key to exit.
pause
