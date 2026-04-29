#!/bin/bash
set -e

BASE="https://static.rust-lang.org/dist"
TARGET="x86_64-unknown-linux-gnu"

mkdir -p dist
cd dist

echo "Downloading channel metadata..."

curl -LO $BASE/channel-rust-stable.toml

echo "Extracting version..."

VERSION=$(grep -m1 'version = ' channel-rust-stable.toml | cut -d '"' -f2)

echo "Rust version: $VERSION"

echo "Downloading toolchain..."

curl -LO $BASE/rustc-$VERSION-$TARGET.tar.xz
curl -LO $BASE/cargo-$VERSION-$TARGET.tar.xz
curl -LO $BASE/rust-std-$VERSION-$TARGET.tar.xz

echo "Download complete"
