@echo off


@REM Store the initial path from where the script was exec
set "init_path=%cd%"

REM Prompt the user for the path to their Git repository
set /p repo_path="Enter the path to your Git repository: "

REM Change to the specified repository directory
cd /d "%repo_path%"

git branch

echo Make sure that all branches are up to date please. use git pull for each branch before continue.
echo.
pause

set /p branch="Enter the name of the branch to cherry-pick from: "
echo.

setlocal EnableDelayedExpansion
set count=0
for /f "tokens=1,2" %%a in ('git log --oneline %branch%') do (
    set /a count+=1
    set hash[!count!]=%%a
    set message[!count!]=%%b
    if !count! equ 5 (
        goto :break
    )
)

:break
set /a endcount=count

:menu
cls
echo "The last 5 commits on the %branch% branch are: "
echo.

for /l %%i in (1,1,!endcount!) do (
    echo [%%i] !hash[%%i]! !message[%%i]!
)

echo.
set /p selection="Enter the number of the commit to cherry-pick, or q to quit: "
if /i !selection! equ q exit /b

if not defined hash[%selection%] (
    echo Invalid selection. Press any key to try again...
    pause >nul
    goto :menu
)

echo.
echo Cherry-picking commit !hash[%selection%]! from branch %branch%...
echo.

git cherry-pick !hash[%selection%]!

echo.
echo Press any key to exit...
pause >nul