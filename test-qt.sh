#!/bin/bash
set -ex
weston --backend=headless-backend.so &
cd build-qt/qtbase/tests/auto/gui/kernel
make check
