
@echo off
setlocal enabledelayedexpansion

:input_loop
set "msg="
set /p "msg=Enter commit message: "
if not defined msg goto input_loop

git add .
git commit -m "!msg!"
git push
pause