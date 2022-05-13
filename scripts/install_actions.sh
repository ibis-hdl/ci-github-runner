#!/bin/bash
GH_RUNNER_VERSION=$1

export TARGET_ARCH="x64"

curl -# -o actions.tar.gz -L "https://github.com/actions/runner/releases/download/v${GH_RUNNER_VERSION}/actions-runner-linux-${TARGET_ARCH}-${GH_RUNNER_VERSION}.tar.gz"
tar -xzf actions.tar.gz
rm -f actions.tar.gz

# https://github.com/actions/runner/blob/v2.290.1/src/Misc/layoutbin/installdependencies.sh
# not required for mcr.microsoft.com/vscode/devcontainers/
#./bin/installdependencies.sh
