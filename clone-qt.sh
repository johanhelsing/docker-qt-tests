#!/bin/bash
branch=5.11 #maybe set this from the Dockerfile
rm -rf qt5
git clone --depth 1 --branch $branch git://code.qt.io/qt/qt5.git
cd qt5
git submodule update --init -- qtbase qtxmlpatterns qtdeclarative qtwayland
cd qtwayland
git checkout $branch
