#!/bin/sh

libs="libsigc++-2.2.10.tar.bz2 cairo-1.12.14.tar.xz gtk+-2.24.23-x11-ardour5.tar.bz2 gtk+-2.24.23-quartz-ardour5.tar.bz2 liblrdf-0.5.0.tar.gz"
location="http://ardour.org/files/deps/"

pushd deps

for lib in $libs
do
  wget $location/${lib}
done

tar -xzvf liblrdf-0.5.0.tar.gz
tar -xzvf cairo-1.12.14.tar.xz
tar -xjvf libsigc++-2.2.10.tar.bz2 
tar -xjvf gtk+-2.24.23-x11-ardour5.tar.bz2
tar -xjvf gtk+-2.24.23-quartz-ardour5.tar.bz2

popd
