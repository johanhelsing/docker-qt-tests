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

You can also test changes on codereview.qt-project.org by copying the `refs/xx/changes/xxxxxx/x` part from the download of a change field. i.e.:

    $ docker run -e QT_DOCKERTEST_QTWAYLAND_REV=refs/changes/26/231726/2 -e QT_DOCKERTEST_QT5_REV=dev -it docker-qt-tests

If you want to pass custom options to configure, you can do so by putting them
in a config.opt file and running docker like this:

    $ docker run -v /path/to/custom/config.opt:/etc/qt/config.opt \
          -e QT_DOCKERTEST_QTWAYLAND_REV=dev \
          -e QT_DOCKERTEST_QT5_REV=dev \
          -it docker-qt-tests

### ccache volume

If you run the image multiple times on similar patch sets, e.g. in CI systems,
you can cache compilation results by using a shared ccache between different
runs. Create a voume using:

    $ docker volume create ccache

And then launch like this

    $ docker run -v ccache:/home/build/.ccache \
          -e QT_DOCKERTEST_QTWAYLAND_REV=dev \
          -e QT_DOCKERTEST_QT5_REV=dev \
          -it docker-qt-tests

By default the cache will be 5GiB, you might want to increase it slightly by
editing ccache.conf in the volume.
