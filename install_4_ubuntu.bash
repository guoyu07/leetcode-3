#!/bin/bash

# for Ubuntu 16.04.3 LTS, ubuntu-16.04.3-server-amd64.iso
# 4.4.0-87-generic #110-Ubuntu SMP Tue Jul 18 12:55:35 UTC 2017



###
apt-get install -y  build-essential
apt-get install -y  kernel-package

apt-get install -y gcc-multilib
apt-get install -y g++-multilib

# ubuntu libz.so.1: cannot open shared object file
apt-get install -y lib32z1

# tar: error while loading shared libraries: libacl.so.1
apt-get  install -y libacl1:i386

# gzip_wrapper.c:27:18: fatal error: zlib.h: No such file or directory
apt-get install -y  zlib1g-dev

# gcc: error: /usr/lib/liblzma.so.0: No such file or directory
# find /lib /usr/ /lib32/ /lib64/ /libx32/ -type f -name "liblzma*"

# /usr/bin/ld: cannot find -lz
apt-get install -y lib32z1-dev


apt-get install -y  flex
apt-get install -y  bison
#  *** 'make menuconfig' requires the ncurses libraries
apt-get install -y  libncurses5-dev

# /usr/bin/ld: cannot find -lncurses
apt-get install -y lib32ncurses5-dev



apt-get install -y  unixodbc-dev
apt-get install -y  libnspr4
apt-get install -y  autoconf
apt-get install -y  automake
apt-get install -y  libtool
apt-get install -y  libmudflap0-dev
apt-get install -y  libltdl3-dev

###
apt-get install -y  libyuv-dev
apt-get install -y  libvpx2-dev
apt-get install -y  liblua5.2-dev
apt-get install -y  libvpx2-dev
apt-get install -y  libvpx2


apt-get install -y  libspeex1
apt-get install -y  libopus-dev
apt-get install -y  libsndfile-dev
apt-get install -y  devscripts
apt-get install -y  gawk
apt-get install -y  git-core
apt-get install -y  'libjpeg-dev|libjpeg62-turbo-dev'
apt-get install -y  'libtool-bin|libtool'
apt-get install -y  python-dev
apt-get install -y  pkg-config
apt-get install -y  libtiff5-dev
apt-get install -y  libperl-dev
apt-get install -y  libgdbm-dev
apt-get install -y  libdb-dev
apt-get install -y  gettext
apt-get install -y  libssl-dev
apt-get install -y  libcurl4-openssl-dev
apt-get install -y  libpcre3-dev
apt-get install -y  libspeex-dev
apt-get install -y  libspeexdsp-dev
apt-get install -y  libsqlite3-dev
apt-get install -y  libedit-dev
apt-get install -y  libldns-dev
apt-get install -y  libpq-dev
apt-get install -y  yasm
###


# install default java, :-)
# root@ipp440-virtual-machine:/home/ipp440/fs/freeswitch# ls /usr/lib/jvm/
# default-java/    java-1.8.0-openjdk-amd64/   .java-1.8.0-openjdk-amd64.jinfo  java-8-openjdk-amd64/
apt-get install -y default-jdk


#Fri Nov 17 15:54:17 HKT 2017

exit 0