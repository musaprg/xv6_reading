#!/bin/sh

# ref) http://sairoutine.hatenablog.com/entry/2016/09/02/232318

brew install coreutils

SRCDIR=`readlink -f .`/src

brew install gcc

export CC=/usr/local/bin/gcc-8
export LD=/usr/local/bin/gcc-8

brew install gmp
brew install mpfr
brew install mpc
brew install qemu

# binutils
echo "Building i386-jos-elf binutils..."
cd /tmp
wget http://ftp.gnu.org/gnu/binutils/binutils-2.31.tar.gz
tar xvf binutils-2.31.tar.gz
mkdir build-binutils
cd build-binutils
../binutils-2.31/configure 	--target=i386-jos-elf 	\
							--disable-werror 		\
							--prefix=/usr/local/
make all
make install

# gcc
echo "Building i386-jos-elf-gcc..."
cd /tmp
wget http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-8.2.0/gcc-8.2.0.tar.gz
tar xvf gcc-8.2.0.tar.gz
mkdir build-gcc
cd build-gcc
../gcc-8.2.0/configure 	--with-gmp-include=/usr/local/include 	\
						--with-gmp-lib=/usr/local/lib 			\
						--with-mpfr-include=/usr/local/include 	\
						--with-mpfr-lib=/usr/local/lib 			\
						--target=i386-jos-elf 					\
						--disable-werror 						\
						--enable-languages=c 					\
						--without-headers 						\
						--disable-nls							\
						--prefix=/usr/local/
make all-gcc
sudo make install-gcc

# build xv6
echo "Building xv6..."
cd $SRCDIR
make

echo "Launching xv6..."
make qemu-nox
