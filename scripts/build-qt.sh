#!/bin/bash
set -ex
mkdir -p build-qt
cd build-qt
cp /etc/qt/config.opt .
../qt5/configure -redo
make module-qtwayland
