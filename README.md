# Git Automation Scripts for Windows

This repository contains a set of batch scripts for Windows that automate essential Git actions. These scripts are designed to help streamline your Git workflow and make it easier to manage your repositories.

Each script prompts the user for the path to the repository they want to access, making it easy to use them for any repository on your system.

## Requirements

This script requires Git to be installed on your system and added to your PATH environment variable. If you haven't already installed Git, you can download it from the official website: https://git-scm.com/downloads.

## Notes

-   ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) Please note that this script will permanently delete local branches that do not have a remote counterpart. Make sure you are certain that you want to delete these branches before confirming each deletion.
    
-   ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) Please note that this script will only delete branches that are fully merged. If you have unmerged branches that you want to delete, you will need to merge them first or delete them manually.
    
-   ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) Important : This script is provided as-is and without warranty. Use at your own risk.

## Scripts

The current set of scripts includes:

- `delete-local-branches-without-remote.bat`: Batch Script for Deleting Local Branches without Remote.

- `cherry-pick-simple.bat`: simplifying the process of picking a commit from another branch to merge it in your current branch. . `comming soon`

- `cherry-pick-adv.bat`: With less human actions : easier process of picking a commit from another branch with or wihout commits to merge it in your current branch. `comming soon`

- `switch-branch-adv.bat`: <!-- creates a new commit with the changes you've made to your local branch. --> `comming soon`


## Usage

### General note
You can simply run the scripts by entering the filename from the file location. Or simply double click the file.

### delete-local-branches-without-remote.bat
To use the script, simply run it by entering its filename:

    delete-local-branches-without-remote.bat

Once executed, the script will prompt you to enter the path to the repository you want to access the directory where your Git repository is located. Then,
The script will prompt you to confirm whether you want to delete each local branch without a remote. Type "y" and press Enter to confirm, or "n" and Enter to cancel.

***Example of execution***

The following scenario is an Example when a local branch founded without a remote counterpart.
```
C:\Users>delete_local_branches_without_remote.bat
Enter the path to your Git repository: C:\Users\Workspace\todolist
The branch found is: feature/localOne
The branch found is: main
Do you want to delete the local branch "feature/localOne" without a remote counterpart? [y/n]: y
"y"
Deleted branch feature/localOne (was c07d337).
Deleted local branch "feature/localOne" without a remote counterpart.
```

### cherry-pick-simple.bat 

`More description comming soon`

### cherry-pick-adv.bat

Running this script, shows the availble branches, then prompts to enter the name of the branch they want to cherry-pick from. The script then displays the last commits 5 by 5 on that branch and prompts the user to select a commit by entering the number next to the commit in the list. `More description comming soon`

### switch-branch-adv.bat

`comming soon`

## Contribution

I hope these scripts will help you save time and increase your productivity when working with Git on Windows. If you have any suggestions or improvements, please feel free to submit a pull request or open an issue on the repository.

These scripts are intended to be used as a starting point for your own custom Git automation scripts. Feel free to edit them to suit your own needs, or to use them as inspiration for your own scripts.

Happy automating!

## Acknowledgments

These scripts were inspired by Q&As found on Stack Overflow and GitHub. Special thanks to the open source community for sharing their knowledge and expertise!

## Author

This project was created by Yassine NATIJ. 
2023