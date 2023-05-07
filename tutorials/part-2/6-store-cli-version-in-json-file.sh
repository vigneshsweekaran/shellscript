#!/bin/bash

set -e

GIT_VERSION=$(git --version | awk '{print $3}')
MAVEN_VERSION=$(mvn --version | grep "Apache Maven" | awk '{print $3}')
FILE_NAME="version.json"


if [[ which jq > /dev/null ]]
then
  echo "{}" > $FILE_NAME
  echo "$(jq --arg git_version "$JAVA_VERSION" '. += {"git": $git_version}' $FILE_NAME)" > $FILE_NAME
  echo "$(jq --arg maven_version "$JAVA_VERSION" '. += {"maven": $maven_version}' $FILE_NAME)" > $FILE_NAME
else
  echo "jq command not found"
fi