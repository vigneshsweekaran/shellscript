#!/bin/bash

users_list=(raghav mani manoj devops)
delete_users_list=(raghav)

# Checks whether user is present or not
check_user(){
  USER=$1

  id ${USER}
  return $?
}

# To create user
create_user(){
  USER=$1
  COMMENT="Managed by script"
  useradd -c "$COMMENT" $USER --create-home
  echo "Created user $USER successfully !!!"
}

# To delete users
delete_users(){
  echo "Deleting Users ..."

  for user in ${delete_users_list[@]};
  do
    check_user $user
    user_status=$?
    
    if [[ $user_status -eq 0 ]]
    then
      userdel -r $user
    else
      echo "The user ${user} doesn't exist !!!"
    fi
  done
}

# Creating users
echo "Creating Users ..."

for user in ${users_list[@]};
do
  check_user $user
  user_status=$?

  if [[ $user_status -ne 0 ]]
  then
    create_user $user
  else
    echo "The user ${user} already exist !!!"
  fi
done

# Deleting Users
# delete_users