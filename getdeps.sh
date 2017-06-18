#!/bin/sh

# build deps
libs="libsigc++-2.2.10.tar.bz2 cairo-1.12.14.tar.xz gtk+-2.24.23-x11-ardour5.tar.bz2 gtk+-2.24.23-quartz-ardour5.tar.bz2 liblrdf-0.5.0.tar.gz"
location="http://ardour.org/files/deps/"
libsigcpp="libsigc++-2.2.10"
librdf="liblrdf-0.5.0"
cairo="cairo-1.12.14"
gtkplus="gtk+-2.24.23"
full_deps="atk 2.14.0atkmm 2.22.7aubio 0.3.2autoconf 2.69automake 1.14.1bison 3.0boost_1.49.0 (OSX, Linux)boost_1.56.0 (Windows)cairo 1.14.8cairomm 1.11.2cmake 2.8.12.2cppunit 1.13.2curl 7.38.0expat 2.1.0ExtUtils-MakeMaker 6.64fftw 3.3.5 git 119aa4cflac 1.3.2flex 2.5.39fontconfig 2.11.1freetype 2.5.3gdk-pixbuf 2.31.1gettext 0.19.3glib 2.42.0glibmm 2.42.0gnome-common 2.34.0gnome-doc-utils 0.20.10gobject-introspection 1.38.0gtk-doc 1.21gtk-engines 2.21.0gtk+ 2.24.23-x11 (Linux)gtk+ 2.24.23-quartz (OSX) gtkmm 2.24.4gtk-osx-docbook 1.0 (OSX)harfbuzz 0.9.35intltool 0.50.2isodate 0.5.0itstool 2.0.2jpegsrc.v9a libarchive 3.2.1libart_lgpl 2.3.21libffi 3.1libiconv 1.14libgnurx 2.5.1 (Windows)liblo 0.28libogg 1.3.2libpng 1.6.25libsamplerate 0.1.8libsigc++ 2.4.1libsndfile 1.0.27libtool 2.4.2 libusb 1.0.20 libvorbis 1.3.4 libxml2 2.9.2 libxslt 1.1.28 lilv 0.24.2 LRDF 0.5.1-rg lv2 1.14.0 m4 1.4.17 make 4.1 NSS-3.25 (Linux) NSS-PEM (Linux) pango 1.40.4 pangomm 2.34.0 pcre 8.36 pixman 0.34.0 pkg-config 0.28 raptor2 2.0.14 rasqal 0.9.32 rdflib 4.1.2 readline 6.3 redland 1.0.17 rubberband 1.8.1 serd 0.24.0-2-g4c66006 setuptools 6.1 sord 0.16.0-3-gf522ced sratom 0.6.0 suil 0.8.4-5-g55e103e taglib 1.9.1 tar 1.27 tiff 4.0.3 util-linux 2.21 vamp-plugin-sdk 2.5 XML-Parser 2.41 XML-Simple 2.22 xz 5.2.2 zlib 1.2.7"
brew install raptor
brew install openssl@1.1
export CPPFLAGS='-I/usr/local/opt/openssl@1.1/include'

wget http://ftp.gnome.org/pub/GNOME/sources/gdk-pixbuf/2.31/gdk-pixbuf-2.31.1.tar.xz
tar -zxvf gdk-pixbuf-2.31.1.tar.xz
pushd gdk-pixbuf-2.31.1
./configure && make && make install
popd

for lib in $libs
do
  pushd deps
  wget $location/${lib}
  popd
done

tar -xjvf ${libsigcpp}.tar.bz2 
pushd ${libsigcpp}
./configure && make && sudo make install
popd

tar -xzvf ${liblrdf}.tar.gz
pushd ${liblrdf}
./configure && make && sudo make install
popd

tar -xzvf ${cairo}.tar.xz
pushd ${cairo}
./configure && make && sudo make install
popd

tar -xjvf gtk+-2.24.23-x11-ardour5.tar.bz2
tar -xjvf gtk+-2.24.23-quartz-ardour5.tar.bz2
pushd ${gtkplus}
./configure --enable-relocation && make && sudo make install
popd

