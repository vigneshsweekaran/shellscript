#!/bin/bash

git fetch --all > /dev/null 2>&1
flag_delete=false

# Exclude pattern
pattern=(*/main */master */dev \              # To match exact branch name eg: main, master, develop
         *test1* \                            # To match specific word in either in branch name or folder name
         */*sta* \                            # To match specific word or char in brach name only
         */bug1/*)                            # To Match specific path in branch name 

if [[ $1 == "clean" ]]; then
  for branch in $(git branch -r |  sed 's/\*//' |  sed '/origin\/HEAD/d' | sed 's/^\s*//'); do
    if !( [[ -f "$branch" ]] || [[ -d "$branch" ]] ) && [[ "$(git log $branch --since "1 month ago" | wc -l)" -eq 0 ]]; then
      for match in "${pattern[@]}"; do
        if [[ $branch == $match ]]; then
          break
        else
          # Reached end of pattern array, so branch name not matching the pattern, we can delete it
          if [[ $match == "${pattern[-1]}" ]]; then flag_delete=true; fi;
        fi
      done
      if [[ "$flag_delete" == "true" && "$2" == "yes" ]]; then
          local_branch_name=$(echo "$branch" | sed 's/origin\///')
          echo "********** Deleting branch: $local_branch_name **********"
          git push --delete origin "${local_branch_name}"
          flag_delete=false
      elif [[ "$flag_delete" == "true" ]]; then
        echo "$branch"
        flag_delete=false
      fi
    fi
  done
fi

retval="true"

check_pattern(){
  argument=$1
  for match in "${pattern[@]}"; do
    if [[ $argument == $match ]]; then
      break
    else
      # Reached end of pattern array, so not matching the pattern
      if [[ $match == "${pattern[-1]}" ]]; then retval=false; fi;
    fi
  done
}

if [[ $1 == "move" ]]; then
  if [[ $2 == "/" ]]; then
    for branch in $(git branch -r | sed '/origin\/HEAD/d' | sed 's/^\s*//' | sed 's/origin\///' | grep -v /); do
      check_pattern "/${branch}"
      if [[ $4 == "yes" && $retval == "false" ]]; then
        echo "********** Moving branch: $branch  --> ${3}/${branch} **********"
        git push origin origin/${branch}:refs/heads/${3}/${branch} :${branch}
        retval="true"
      elif [[ $retval == "false" ]]; then
        echo "$branch  --> ${3}/${branch}"
        retval="true"
      fi
    done
  else
    for branch in $(git branch -r | sed '/origin\/HEAD/d' | sed 's/^\s*//' | grep ^origin/$2/); do
      old_branch_name=$(echo "${branch}" | awk -F "/" '{print $NF}')
      if [[ $4 == "yes" ]]; then
        echo "********** Moving branch: $2/${old_branch_name} --> ${3}/${old_branch_name} **********"
        git push origin ${branch}:refs/heads/${3}/${old_branch_name} :$2/${old_branch_name}
      else
        echo "$2/${old_branch_name} --> ${3}/${old_branch_name}"
      fi
    done
  fi
fi

# Examples for moving branch from one folder to another folder (It creates new branch and delete old branch)

# For moving from / to folder
# For Dry run
#   ./cleanup/sh move / feature
# For moving
#   ./cleanup/sh move / feature yes

# For moving between two folders
# For Dry run
#   ./cleanup.sh move src_folder destination_folder
#   ./cleanup/sh move bug feature
# For moving
#   ./cleanup/sh move bug feature yes

# For moving between two level source folder and one destination folder
# For Dry run
#   ./cleanup.sh move src_folder destination_folder
#   ./cleanup/sh move feature/new feature
# For moving
#   ./cleanup/sh move feature/new feature yes

#-------------------------------------------------------------------------------------------------

# Examples for Deleting branch (It creates new branch and delete old branch)
# For Dry run
#   ./cleanup/sh clean
# For Deleting
#   ./cleanup/sh clean yes

#--------------------------------------------------------------------------------------------------

# More pattern samples
# To match exact branch name eg: main, master, develop
# */main */master */dev */feature/add-button

# To match specific word in either in branch name or folder name
# *test1* *tes* *es* *feature*

# To match specific word or char in brach name only
# */*sta* */*sta-* */*action*

# To Match specific path in branch name 
# */bug1/* */feature/*
