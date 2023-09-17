#!/usr/bin/env bash

echo "Commit message:"
read commit_message

git pull
# Add changes to the staging area
git add .

# Commit changes with a message
git commit -m "$commit_message"

# Push changes to the remote repository
git push

