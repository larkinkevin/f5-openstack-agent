#!/usr/bin/env bash

set -ex

# - copy results files to nfs (note that the nfs results directory is mounted
#    inside the CI worker's home directory)
src=$(find $WORKSPACE/systest/test_results -mindepth 2 -maxdepth 2 -type d)
cp -r $src/* $CI_RESULTS_DIR/
