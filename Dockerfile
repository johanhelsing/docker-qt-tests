FROM debian:stretch
RUN apt-get update && apt-get install -y \
        build-essential \
        chrpath \
        cpio \
        diffstat \
        gcc-multilib \
        git-core \
        libsdl1.2-dev \
        libwayland-dev \
        python-crypto \
        socat \
        texinfo \
        unzip \
        vim \
        weston \
        wget

RUN id build 2>/dev/null || useradd --uid 1000 --create-home build
RUN apt-get -y install sudo
RUN echo "build ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers

USER build
WORKDIR /home/build/

# TODO: everything from this point could be done by the container and not the image
COPY clone-qt.sh /home/build
RUN ./clone-qt.sh

ENV MAKEFLAGS=-j8
COPY build-qt.sh /home/build
RUN ./build-qt.sh

COPY build-qtbase-tests.sh /home/build
RUN ./build-qtbase-tests.sh

COPY build-qtwayland-tests.sh /home/build
RUN ./build-qtwayland-tests.sh

ENV XDG_RUNTIME_DIR=/tmp
ENV QT_QPA_PLATFORM=wayland
COPY test-qt.sh /home/build
CMD "./test-qt.sh"
