#!/bin/bash
set -ex
srcdir=$(pwd)/qt5
qt5_rev=${QT_DOCKERTEST_QT5_REV:-5.11}

git fetch --depth 1 origin "$qt5_rev"
git checkout FETCH_HEAD
git submodule update --init -- qtbase qtxmlpatterns qtdeclarative qtwayland

if [[ -v QT_DOCKERTEST_QTWAYLAND_REV ]] ; then
    cd "$srcdir/qtwayland"
    git fetch --depth 1 origin "$QT_DOCKERTEST_QTWAYLAND_REV"
    git checkout FETCH_HEAD
fi
