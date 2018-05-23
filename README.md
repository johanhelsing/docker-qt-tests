# Docker container for running Qt auto-tests

This container uses a headless Weston server and llvmpipe to run Qts auto tests
with OpenGL and Wayland without requiring a display (i.e. it can run on a
server)

## Usage

Usage is very simple, like almost any other docker image

Build:

    $ docker build -t docker-qt-tests .

Run:

    $ docker run -e QT_DOCKERTEST_QTWAYLAND_REV=<sha1> -e QT_DOCKERTEST_QT5_REV=<sha1> -it docker-qt-tests

I.e. to run tests on the 5.11 branch:

    $ docker run -e QT_DOCKERTEST_QTWAYLAND_REV=5.11 -e QT_DOCKERTEST_QT5_REV=5.11 -it docker-qt-tests
