#!/bin/sh

# Make .git_hooks folder as hooks source for git
git config core.hooksPath .git_hooks/

# install commitlint and @fingerprintjs/commit-lint-dx-team globally
npm install -g commitlint @fingerprintjs/commit-lint-dx-team
