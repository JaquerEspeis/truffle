#!/bin/bash

set -ev

git config --global user.email "eljaqueado@elopio.net"
git config --global user.name "El Jaqueado"

git remote add upstream https://github.com/trufflesuite/truffle.git
git fetch upstream

git rebase upstream/develop
git checkout -b $TRAVIS_BRANCH-sync

git remote add origin-with-token https://${GH_TOKEN}@github.com/jaquerespeis/truffle.git

git push -f --set-upstream origin-with-token $TRAVIS_BRANCH-sync:$TRAVIS_BRANCH
