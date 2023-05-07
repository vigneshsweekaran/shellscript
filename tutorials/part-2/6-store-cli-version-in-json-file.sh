#!/bin/bash

set -e

GIT_VERSION=$(git --version)
MAVEN_VERSION=$(mvn --version)
JAVA_VERSION=$(java -version)
PYTHON_VERSION=$(python --version)

FILE_NAME="version.json"


if [[ which jq > /dev/null ]]
then
  echo "{}" > $FILE_NAME
  echo "$(jq --arg git_version "$JAVA_VERSION" '. += {"git": $git_version}' $FILE_NAME)" > $FILE_NAME
  echo "$(jq --arg maven_version "$JAVA_VERSION" '. += {"maven": $maven_version}' $FILE_NAME)" > $FILE_NAME
  echo "$(jq --arg java_version "$JAVA_VERSION" '. += {"java": $java_version}' $FILE_NAME)" > $FILE_NAME
  echo "$(jq --arg python_version "$JAVA_VERSION" '. += {"python": $python_version}' $FILE_NAME)" > $FILE_NAME
else
  echo "jq command not found"
fi