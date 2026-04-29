#!/bin/bash
set -e

BASE="https://static.rust-lang.org/dist"
TARGET="x86_64-unknown-linux-gnu"

mkdir -p dist
cd dist

echo "Downloading metadata..."

curl -L -O $BASE/channel-rust-stable.toml

VERSION=$(grep -m1 'version = ' channel-rust-stable.toml | cut -d '"' -f2)

echo $VERSION > VERSION

echo "Rust version: $VERSION"

curl -L -O $BASE/rustc-$VERSION-$TARGET.tar.xz
curl -L -O $BASE/cargo-$VERSION-$TARGET.tar.xz
curl -L -O $BASE/rust-std-$VERSION-$TARGET.tar.xz

echo "Download finished"
