# Docker container for running Qt auto-tests

This container uses a headless Weston server and llvmpipe to run Qts auto tests
with OpenGL and Wayland without requiring a display (i.e. it can run on a
server)

## Usage

    $ docker build -t docker-qt-tests
