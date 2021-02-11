#!/bin/bash

# create/init a temporary git repo to perform work in
rm -rf tmp && mkdir tmp && cd tmp && git init .
echo "test" > test.txt
git add test.txt && git commit -m "initial commit"

# clone libssh2-1.8.0
git subrepo clone git@github.com:libssh2/libssh2.git libssh2 -b libssh2-1.8.0

# edit a file which hasn't changed since libssh2-0.15, add and commit
(echo "# hello" && cat libssh2/m4/autobuild.m4) > x && mv x libssh2/m4/autobuild.m4
git add libssh2/m4/autobuild.m4 && git commit -m "say hello"

# pull/merge libssh2-1.8.1
git subrepo pull libssh2 -b libssh2-1.8.1

# attempt to pull/merge libssh2-1.8.2 (fails)
git subrepo pull libssh2 -b libssh2-1.8.2
