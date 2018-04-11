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
        libxkbcommon-dev \
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

ENV QT_DOCKERTEST_QT5_REV=dev

ENV XDG_RUNTIME_DIR=/tmp
ENV QT_QPA_PLATFORM=wayland
ENV MAKEFLAGS=-j8

# Keep Qt source code as part of the image to avoid duplication
COPY scripts/clone-qt.sh /home/build/scripts/clone-qt.sh
RUN scripts/clone-qt.sh

COPY scripts/ /home/build/scripts
CMD "./scripts/run.sh"
