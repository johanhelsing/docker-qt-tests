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
ENV MAKEFLAGS=-j9
COPY clone-qt.sh /home/build
RUN ./clone-qt.sh
COPY build-qt.sh /home/build
RUN ./build-qt.sh
ENV XDG_RUNTIME_DIR=/tmp
ENV QT_QPA_PLATFORM=wayland
COPY test-qt.sh /home/build
CMD "/bin/bash"

