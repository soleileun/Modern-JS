#!/bin/bash

COMMIT=${CIRCLE_SHA1}
echo commit log is ${COMMIT}
GIT_LOG=$(git log -1 --format=format%H -- ./$0)
echo git log is ${GIT_LOG}

if [ "${COMMIT}" != "${GIT_LOG}" ]; then
    echo cancel circle ci
    circleci-agent step halt
fi
