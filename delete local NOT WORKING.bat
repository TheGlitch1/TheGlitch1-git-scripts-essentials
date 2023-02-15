@echo off

setlocal enabledelayedexpansion

REM Change to the specified repository directory
REM cd /d "%repo_path%"
cd /d "C:\Users\Workspace Y\VScodeExtenssion\todolist"

set "local_branches="
for /f "delims=" %%i in ('git branch -l') do (
  set "branch=%%i"
  echo The branch : %branch%
  set "branch=%branch:\=/"%"
  if not "x%branch%" == "x" (
    set "local_branches=!local_branches! %branch%"
  )
  echo The branch after removing the first two characters is: %branch%
)

if not defined local_branches (
  echo There are no local branches.
) else (
  echo The local branches are: %local_branches%
  
  echo.
  echo Checking for branches without a remote counterpart...
  
  for %%b in (%local_branches%) do (
    if not "x%%b" == "x" (
      set "has_remote="
      for /f "delims=" %%r in ('git branch -r') do (
        if "%%r" == "%%b" (
          set "has_remote=1"
        )
      )
      if not defined has_remote (
        echo Branch "%%b" does not have a remote counterpart.
        echo Deleting local branch "%%b"...
        git branch -d "%%b"
      )
    )
  )
)

endlocal
cd /d "C:\Users\Workspace Y\Git essentials"