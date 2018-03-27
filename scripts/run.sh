#!/bin/bash
set -ex
#time scripts/clone-qt.sh
#echo Finished cloning
time scripts/checkout-qt.sh
echo Finished preparing sources
time scripts/build-qt.sh
echo Finished building
time scripts/build-qtbase-tests.sh
echo Finished building qtbase tests
time scripts/build-qtwayland-tests.sh
echo Finished building qtwayland tests
time scripts/test-qt.sh
echo Finished testing
