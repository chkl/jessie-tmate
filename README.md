# jessie-tmate
build-script and docker-file to compile tmate on debian jessie

A small script to compile the [tmate-slave](https://github.com/tmate-io/tmate-slave).

The resulting binary is still not statically-linked but should run on a vanilla
jessie installation that has the following packages installed: `libmsgpackc2
libssh-4 libevent-2.0-5`.

