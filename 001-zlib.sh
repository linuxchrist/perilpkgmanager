#
#
# uports: a universal linux/gnu ports collection
. ./uports-config && PATH=$tpath

pkgname=utoolscross-zlib
pkgver=1.2.8
pkgrel=1
maintainer="linuxchrist@gmail.com"
description="contains compression and decompression routines used by some programs."
homepage="https://zlib.net/"
sources="https://zlib.net/fossils/zlib-1.2.8.tar.gz"
arch=amd64
depends=
comment="uports: a universal linux/gnu ports collection"
checkpkginfo

cd $src
if [ ! -f zlib-1.2.8.tar.gz ]; then wget $sources; fi
tar -xvf zlib-1.2.8.tar.gz
cd zlib-$pkgver

./configure \
	--prefix=$utoolscross \
	--shared --static

make -j$(nproc)
make install DESTDIR=$installdir || exit $?

defaultpackager
cd $src && rm -rf zlib-$pkgver
cd $pkgdir && dpkg --force-all -i $fullpkgname.deb
# end of file
