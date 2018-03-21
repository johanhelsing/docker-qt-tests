#!/bin/bash
set -ex
qt5_rev=5.11 #maybe set this from the Dockerfile
qtwayland_rev=5.11
rm -rf qt5
mkdir qt5
cd qt5
git init
git remote add origin https://codereview.qt-project.org/qt/qt5.git
git fetch --depth 1 origin "$qt5_rev"
git checkout FETCH_HEAD

git submodule update --init --depth 1 -- qtbase qtxmlpatterns qtdeclarative qtwayland

cd qtwayland
git fetch --depth 1 origin "$qtwayland_rev"
git checkout FETCH_HEAD
