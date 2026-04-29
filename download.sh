#!/bin/bash
set -e

TARGET="x86_64-unknown-linux-gnu"
BASE="https://static.rust-lang.org/dist"

mkdir -p dist
cd dist

echo "Downloading channel metadata..."

curl -LO $BASE/channel-rust-stable.toml
curl -LO $BASE/channel-rust-stable.toml.sha256

echo "Downloading toolchain..."

curl -LO $BASE/rustc-stable-$TARGET.tar.xz
curl -LO $BASE/cargo-stable-$TARGET.tar.xz
curl -LO $BASE/rust-std-stable-$TARGET.tar.xz

echo "Done."
