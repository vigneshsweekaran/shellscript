#!/bin/bash

set -e

GIT_VERSION=$(git --version | awk '{print $3}')
MAVEN_VERSION=$(mvn --version | grep "Apache Maven" | awk '{print $3}')
FILE_NAME="version.json"

echo "{}" > $FILE_NAME
echo "$(jq --arg git_version "$GIT_VERSION" '. += {"git": $git_version}' $FILE_NAME)" > $FILE_NAME
echo "$(jq --arg maven_version "$MAVEN_VERSION" '. += {"maven": $maven_version}' $FILE_NAME)" > $FILE_NAME
