@echo off

setlocal enabledelayedexpansion

REM Prompt the user for the path to their Git repository
set /p repo_path="Enter the path to your Git repository: "

REM Change to the specified repository directory
cd /d "%repo_path%"
set "local_branches="
REM Define an array to store the names of local branches
for /f "delims=" %%i in ('git branch') do (
  if "%%i" NEQ "*" (
    set "branch=%%i"
    REM echo The branch is: !branch!
    set branch=!branch:~2!
    echo The branch found is: !branch!
    set "local_branches=!local_branches! !branch!"
  )
)

REM echo The local branches are: %local_branches%

REM Check if there are any local branches
set "branch_name="
if defined local_branches (
  REM Loop through the local branches
  for %%b in (!local_branches!) do (
    REM Check if the branch has a remote counterpart
    git show-ref --verify --quiet "refs/remotes/origin/%%b"
    REM echo %errorlevel%
    if errorlevel 1 (
      REM If not, ask the user if they want to delete the branch
      set "branch_name=%%b"
      set /p choice= "Do you want to delete the local branch "%%b" without a remote counterpart? [y/n]: "
      echo "!choice!"
      if /i "!choice!"=="y" (
        git branch --merged | findstr /r "^\*"
        if errorlevel 1 (
            echo Failed to delete local branch %%b without a remote counterpart...checking issue...
            echo Local branch "%%b" has unmerged changes, deletion cancelled.
                @REM REM use in case we want to force without verifying
                @REM git branch -D --no-verify ""%%b"
        ) else (
            git branch -d "%%b" 
            if errorlevel 0 (
                echo Deleted local branch "%%b" without a remote counterpart.           
            ) 
            if errorlevel 1  (
                echo Failed to delete local branch %%b without a remote counterpart...checking issue...
                git checkout "%%b"
                if errorlevel 1 (
                    echo Could not switch to branch "%%b". Skipping...
                    echo Because already on "%%b". Skipping...
                )
               @REM continue
            )
        )
      )
    )
  )
) else (
  echo No local branches without remote counterparts found.
)

cd /d "C:\Users\a841618\Workspace Y\Git essentials"

endlocal