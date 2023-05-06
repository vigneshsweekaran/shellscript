#!/bin/bash

set -e

GIT_VERSION=$(git --version)
MAVEN_VERSION=$(mvn --version)
JAVA_VERSION=$(java -version)
PYTHON_VERSION=$(python --version)

FILE_NAME="version.json"


if [[ which jq > /dev/null ]]
then
  cat -n ''
  jq --arg git_version ${GIT_VERSION} '. + {git: $git_version}'
else
  echo "jq command not found"
fi