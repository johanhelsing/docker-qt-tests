#!/bin/bash
set -ex
qt5_rev=${QT_DOCKERTEST_QT5_REV:-5.11}
rm -rf qt5
mkdir qt5
cd qt5
git init
git remote add origin https://codereview.qt-project.org/qt/qt5.git
git fetch --depth 1 origin "$qt5_rev"
git checkout FETCH_HEAD

#proper shallow cloning doesn't work for debian stretch for some reason
#git submodule update --init --depth 1 -- qtbase qtxmlpatterns qtdeclarative qtwayland
git submodule update --init --depth 50 -- qtbase qtxmlpatterns qtdeclarative qtwayland

if [[ -v QT_DOCKERTEST_QTWAYLAND_REV ]] ; then
    cd qtwayland
    git fetch --depth 1 origin "$QT_DOCKERTEST_QTWAYLAND_REV"
    git checkout FETCH_HEAD
fi
