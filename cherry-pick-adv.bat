@echo off


@REM Store the initial path from where the script was exec
set "init_path=%cd%"

REM Prompt the user for the path to their Git repository
set /p repo_path="Enter the path to your Git repository: "

REM Change to the specified repository directory
cd /d "%repo_path%"

:search_branch
git branch

echo Make sure that all branches are up to date please. use git pull for each branch before continue.
echo.
pause

set /p branch="Enter the name of the branch to cherry-pick from: "
echo.

setlocal EnableDelayedExpansion
:cherry_pick_loop
set count=0
@REM TODO: message array doest contain the fukk commit message with tokens=1,2
for /f "tokens=1,*" %%a in ('git log --oneline %branch%') do (
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


set /p choice=Do you want to cherry-pick another commit? (Y/N)

if /i "%choice%"=="Y" (
    set /p same_branch=Is it from the same branch? (Y/N)
    if /i "%same_branch%"=="Y" (
        @REM git log %branch% --oneline -n 5 --skip 5
        goto cherry_pick_loop
    ) else (
        @REM set /p branch=Enter the new branch name to cherry-pick from:
        @REM git log %branch% --oneline -n 5
        goto search_branch
    )
)

echo "Don't forget to put a star on the repo. See you soon!"

echo.
echo Press any key to exit...
pause >nul
