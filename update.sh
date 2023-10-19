#!/run/current-system/sw/bin/bash
echo "Commit message:"
read commit_message


# Add changes to the staging area
git add .

# Commit changes with a message
git commit -m "$commit_message"
git pull
# Push changes to the remote repository
git push origin develop

