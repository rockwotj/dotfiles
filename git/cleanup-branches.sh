#!/usr/bin/env bash

set -euo pipefail

file="/tmp/git-cleanup-branches-$(uuidgen)"

function removeCurrentBranch {
  sed -E '/\*/d'
}

function leftTrim {
  sed -E 's/\*?[[:space:]]+//'
}


all_branches=$(git branch | removeCurrentBranch | leftTrim)

# write branches to file
for branch in $all_branches; do
  echo "keep $branch" >> $file
done

# write instructions to file
echo "

# All of your branches are listed above
# (except for the current branch, which you can't delete)
# change keep to d to delete the branch
# all other lines are ignored" >> $file

# prompt user to edit file
$EDITOR "$file"

# check each line of the file
cat $file | while read -r line; do

  # if the line starts with "d "
  if echo $line | grep --extended-regexp "^d " > /dev/null; then
    # delete the branch
    branch=$(echo $line | sed -E 's/^d //')

    git branch -D $branch
  fi
done

# clean up
rm $file