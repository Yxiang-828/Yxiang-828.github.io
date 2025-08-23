@echo off
REM Compile and run Java tests for ex_wk1 (robust)
pushd %~dp0

:: Check for javac
where javac >nul 2>&1
if %ERRORLEVEL% neq 0 (
  echo ERROR: 'javac' not found on PATH. Please install a JDK (see README.md) and reopen the terminal.
  pause
  popd
  exit /b 2
)

:: Determine which source file to compile (Main.java or ex.java)
set SRC=
if exist Main.java (
  set SRC=Main.java
) else (
  if exist ex.java (
    echo Note: Found ex.java, will compile ex.java directly.
    set SRC=ex.java
  ) else (
    echo ERROR: No Main.java or ex.java found in this folder.
    pause
    popd
    exit /b 3
  )
)

echo Compiling %SRC% and TestRunner.java...
javac %SRC% TestRunner.java
if errorlevel 1 (
  echo Compilation failed.
  pause
  popd
  exit /b 1
)

echo Running tests...
java -ea TestRunner
set rc=%ERRORLEVEL%

echo Test run finished with exit code %rc%.
pause
popd
exit /b %rc%
