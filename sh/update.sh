#!/run/current-system/sw/bin/bash

cd "$HOME/repos/nixflakes" || exit 1

echo "Commit message:"
read commit_message

# Add changes to the staging area
git add .

# Commit changes with a message
git commit -m "$commit_message"

# Push changes to the remote repository
git push 

