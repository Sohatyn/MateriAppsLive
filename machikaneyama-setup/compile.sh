#!/bin/sh

# Compile script for Machikaneyama 2002 written by Synge Todo

SOURCE="$1"
PREFIX="$2"
COMPILER="$3"
OPTION="$4"

if [ -z "$PREFIX" ]; then
  echo "Usage: $0 source_tarball prefix [compiler [option]]"
  exit 127
fi

PREFIX=`(cd $PREFIX && pwd)`
SCRIPTDIR=`dirname $0`
SCRIPTDIR=`(cd $SCRIPTDIR && pwd)`

SHAREDIR="$PREFIX/share"
BUILDDIR="$PREFIX/build"
MACHIKANEYAMADIR="$SHAREDIR/machikaneyama"

# Extract files from the tarball
if [ -f "$SOURCE" ]; then :; else
  echo "Error: source not found ($SOURCE)"
  exit 127
fi
MD5SUM=`md5sum "$SOURCE" | awk '{print $1}'`
if [ "$MD5SUM" = "bd9947cd30b4a42c7150364aa56e5a6e" ]; then
  VERSION="cpa2002v009c"
  VERSION_STRING="$VERSION (September 14, 2013)"
else
  echo "Error: unkown version or corrupted archive"
  exit 127
fi
echo "Machikaneyama version = $VERSION_STRING"
mkdir -p "$BUILDDIR"
echo "Extracting $SOURCE into $BUILDDIR"
tar zxvf "$SOURCE" -C "$BUILDDIR"

# Patch
echo "Applying patch..."
patch -i "$SCRIPTDIR/$VERSION.patch" -p1 -d "$BUILDDIR/$VERSION"
    
# Compile
echo "Compiling Machikaneyama"
if [ -n "$COMPILER" ]; then
  if [ -n "$OPTION" ]; then
    echo make clean default -C "$BUILDDIR/$VERSION" fort="$COMPILER" flag="$OPTION"
    make clean default -C "$BUILDDIR/$VERSION" fort="$COMPILER" flag="$OPTION"
  else
    echo make clean default -C "$BUILDDIR/$VERSION" fort="$COMPILER"
    make clean default -C "$BUILDDIR/$VERSION" fort="$COMPILER"
  fi
else
  if [ -n "$OPTION" ]; then
    echo make clean default -C "$BUILDDIR/$VERSION" flag="$OPTION"
    make clean default -C "$BUILDDIR/$VERSION" flag="$OPTION"
  else
    echo make clean default -C "$BUILDDIR/$VERSION"
    make clean default -C "$BUILDDIR/$VERSION"
  fi
fi

# Install
echo "Installing Machikaneyama"
make install -C "$BUILDDIR/$VERSION" prefix="$PREFIX"
