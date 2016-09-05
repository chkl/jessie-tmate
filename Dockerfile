#FROM moander/wheezy
FROM debian:jessie

MAINTAINER chkl

ENV HOME /root

RUN apt-get update && \
    apt-get -y install autoconf autogen automake build-essential cmake coreutils \
               git locales wget zlib1g-dev libssl-dev pkg-config libevent-dev \
               libncurses-dev

# let's build msgpack

RUN cd && \
    git clone https://github.com/msgpack/msgpack-c.git && \
    cd msgpack-c && \
    cmake . && \
    make && \
    make install

# and libssh (0.7.2)
RUN cd && \
    wget https://red.libssh.org/attachments/download/177/libssh-0.7.2.tar.xz && \
    tar -xf libssh-0.7.2.tar.xz && \
    mkdir libssh-0.7.2-build && \
    cd    libssh-0.7.2-build && \
    cmake ../libssh-0.7.2 && \
    make && \
    make install && \
    ldconfig


# and finally tmate-slave
RUN cd && \
    git clone https://github.com/nviennot/tmate-slave.git && \
    cd tmate-slave && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install
