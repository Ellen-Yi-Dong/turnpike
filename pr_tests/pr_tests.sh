#!/bin/bash

set -ex

pip3 install --upgrade pip pipenv
pipenv lock --clear
pipenv install -d
pipenv run pytest --disable-pytest-warnings tests/
result=$?

if [ $result -ne 0 ]; then
    echo '====================================='
    echo '====  ✖  ERROR: PR_CHECK FAILED  ===='
    echo '====================================='
    exit 1
fi
