#!/bin/bash
mkdir build-qt
cd build-qt
../qt5/configure -opensource -confirm-license -developer-build -no-xcb -feature-wayland-client && make module-qtwayland
