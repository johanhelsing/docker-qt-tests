#!/bin/bash
set -ex
mkdir -p build-qt
cd build-qt
../qt5/configure \
    -opensource \
    -confirm-license \
    -developer-build \
    -no-xcb \
    -no-feature-vnc \
    -no-linuxfb \
    -nomake examples \
    -nomake tests \
    -feature-wayland-client
time make -ks module-qtwayland
