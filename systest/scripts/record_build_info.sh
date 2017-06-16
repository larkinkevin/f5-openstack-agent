#!/usr/bin/env bash

set -ex

# - write Jenkins build info to disk
mkdir -p $CI_RESULTS_DIR
build_fl="${CI_RESULTS_DIR}/ci-build.yaml"
echo "build_id: $BUILD_ID" > $build_fl
echo "build_url: ${BUILD_URL}consoleFull" >> $build_fl
echo "build_sha: $(git rev-parse HEAD)" >> $build_fl
