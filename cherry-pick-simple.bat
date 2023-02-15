@echo off

set /p branch="Enter the name of the branch to cherry-pick from: "
echo.

echo "The last 5 commits on the %branch% branch are: "
echo.

git log --oneline -5 %branch%

echo.
set /p commit="Enter the commit hash to cherry-pick, or q to quit: "
if /i %commit% equ q exit /b

echo.
echo "Cherry-picking commit %commit% from branch %branch%..."
echo.

git cherry-pick %commit%