#!/bin/bash
echo Using Git Repo: ${GIT_REPO:="https://github.com/SpectraLogic/ds3_c_sdk.git"}
echo Using Git Branch: ${GIT_BRANCH:="master"}

echo DS3_ENDPOINT ${DS3_ENDPOINT}
echo DS3_SECRET_KEY ${DS3_SECRET_KEY}
echo DS3_ACCESS_KEY ${DS3_ACCESS_KEY}

echo "cd /opt"
cd /opt

if [ ${GIT_BRANCH} != "master" ]; then
  echo git clone ${GIT_REPO} --branch ${GIT_BRANCH} --single-branch
  git clone ${GIT_REPO} --branch ${GIT_BRANCH} --single-branch
else
  echo git clone ${GIT_REPO}
  git clone ${GIT_REPO}
fi

echo "cd ds3_c_sdk/test"
cd ds3_c_sdk/test

echo "./build_local.sh"
./build_local.sh

echo "make mem"
make mem
