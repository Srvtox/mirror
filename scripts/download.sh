#!/bin/bash
set -e

BASE="https://static.rust-lang.org/dist"
TARGET="x86_64-unknown-linux-gnu"

mkdir -p dist
cd dist

echo "Downloading metadata..."
curl -L -O $BASE/channel-rust-stable.toml

VERSION=$(grep -A1 '\[pkg.rust\]' channel-rust-stable.toml | grep version | cut -d '"' -f2 | cut -d ' ' -f1)

echo "Rust version: $VERSION"
echo $VERSION > VERSION

echo "Downloading toolchain..."

curl -L -O $BASE/rustc-$VERSION-$TARGET.tar.xz
curl -L -O $BASE/cargo-$VERSION-$TARGET.tar.xz
curl -L -O $BASE/rust-std-$VERSION-$TARGET.tar.xz

echo "Downloaded files:"
ls -lh
