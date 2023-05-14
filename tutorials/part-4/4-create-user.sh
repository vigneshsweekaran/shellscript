#!/bin/bash

users=(raghav mani manoj devops)

chcek_user(){
  USER=$1

  id ${USER}
  return status=$?
}

add_user(){
  USER=$1
  PASSWORD="default_password"
  COMMENT="Managed by script"
  useradd -c "$COMMENT" $USER
  passwd $USER $PASSWORD
  echo "Created user $USER successfully !!!"
}


echo "Creating users ..."

for user in ${users[@]};
do
  user_status=check_user $user

  if [[ $user_status -ne 0 ]]
  then
    add_user $user
  else
    echo "The user ${user} already exist !!!"
  fi
done
